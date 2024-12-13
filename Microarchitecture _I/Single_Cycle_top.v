`include "P_c.v"
`include "Instruction_Memory.v"
`include "Register_files.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_unit_top.v"
`include "Data_Mem.v"
`include "PC_Adder.v"
`include "Mux.v"

module Single_Cycle_top (clk,rst);

    input clk,rst;
    wire [31:0] PC_top ,RD_Instr,RD1_top,RD2_top,Imm_Ext_top,Alu_result,ReadData,PCPlus4,PC,SrcB,Result;
    wire RegWrite,MemWrite,ALUSrc,ResultSrc;
    wire [2:0] ALUControl_top;
    wire [1:0]ImmSrc;

    P_C  P_C (.PC_NEXT(PCPlus4),
             .PC(PC_top),
             .rst(rst),
             .clk(clk)          
             );

    PC_adder PC_aader (.a(PC_top),
                       .b(32'd4),
                       .c(PCPlus4));

    Instr_Mem Instruction_Memory (.A(PC_top),
                                  .rst(rst),
                                  .RD(RD_Instr)
                                  );

    Reg_file Register_files (.A1(RD_Instr[19:15]),
                             .A2(RD_Instr[24:20]),
                             .A3(RD_Instr[11:7]),
                             .WD3(Result),
                             .WE3(RegWrite),
                             .clk(clk),
                             .rst(rst),
                             .RD1(RD1_top),
                             .RD2(RD2_top)
    );

    Sign_Extend sign_extend (.In(RD_Instr),
                             .Imm_Ext(Imm_Ext_top),
                             .ImmSrc(ImmSrc[0]));

       Mux Mux_Register_to_ALU(
                            .a(RD2_top),
                            .b(Imm_Ext_top),
                            .s(ALUSrc),
                            .c(SrcB)
    );

    alu Alu (.A(RD1_top),
             .B(Imm_Ext_top),
             .ALUControl(ALUControl_top),
             .Result(Alu_result),
             .Z(),
             .N(),
             .V(),
             .C());

    Control_Unit_Top Control_unit_top(.Op(RD_Instr[6:0]),
                                      .RegWrite(RegWrite),
                                      .ImmSrc(ImmSrc),
                                      .ALUSrc(ALUSrc),
                                      .MemWrite(MemWrite),
                                      .ResultSrc(ResultSrc),
                                      .Branch(),
                                      .funct3(RD_Instr[14:12]),
                                      .funct7(RD_Instr[6:0]),
                                      .ALUControl(ALUControl_top));

    Data_Menmory Data_mem ( .A(Alu_result),
                            .WD(RD2_top),
                            .clk(clk),
                            .WE(MemWrite),
                            .RD(ReadData),
                            .rst(rst));

      Mux Mux_DataMemory_to_Register(
                            .a(Alu_result),
                            .b(ReadData),
                            .s(ResultSrc),
                            .c(Result)
    );


    
endmodule