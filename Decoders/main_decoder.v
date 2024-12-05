module main_decoder(Op,zero,RegWrite,MemWrite,ImmSrc,ALUSrc,ResultSrc,PCSrc,ALUOp);

    // Inputs / outputs declaration
    input zero;
    input [6:0] Op;
    output RegWrite;
    output [1:0] ImmSrc,ALUOp;
    output ALUSrc;
    output MemWrite;
    output ResultSrc;
    output PCSrc;

    // Interim wire
    wire Branch;


    assign RegWrite = ((Op == 7'b0000011) || (Op == 7'b0110011)) ? 1'b1 : 1'b0 ;

    assign MemWrite = ((Op == 7'b0100011))? 1'b1 : 1'b0 ;

    assign ResultSrc = ((Op == 7'b0000011)) ? 1'b1 : 1'b0;

    assign ALUSrc = ((Op == 7'b0000011) || (Op == 7'b0100011)) ? 1'b1 : 1'b0 ;

    assign Branch = ((Op == 7'b1100011)) ? 1'b1 : 1'b0;

    assign ImmSrc = ((Op == 7'b0100011)) ? 2'b01 : ((op == 7'b1100011)) ? 2'b10 :2'b00;

    assign ALUOp =  ((Op == 7'b1100011)) ? 2'b01 : ((op == 7'b0110011)) ? 2'b10 :2'b00;

    assign PCSrc = zero & Branch;


endmodule