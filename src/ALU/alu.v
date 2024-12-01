module alu (A,B,ALUControl,Result,Z,N,V,C);  //Z = zero flag ,N= negative,flag  V= overflow flag,C= carry flag

    // declare inputs
    input [31:0] A,B;
    input [2:0] ALUControl;

    // declare outputs
    output [31:0]Result;

    // declareing interim wires
    wire [31:0] a_and_b;
    wire [31:0]a_or_b;
    wire [31:0] not_b;
    wire [31:0] mux_1;
    wire [31:0] sum;
    wire [31:0] mux_2;
    wire Cout;
    wire  [31:0] slt;

    // loguc design

    // AND operation
    assign a_and_b=A & B;

    // OR operation
    assign a_or_b = A|B;

    // not operation on B
    assign not_b= ~ B;

    assign mux_1 = (ALUControl[0]==1'b1)? not_b : B ;

    // Addition and subtraction 
    assign {Cout,sum} = A + mux_1 + ALUControl[0];

    // Zero extension
    assign slt = {31{1'b0},sum[31]}

    // mux_2
    case (ALUControl[2:0])
       3'b000 : mux_2=sum;
       3'b001 : mux_2=sum;
       3'b010 : mux_2=a_and_b;
       3'b011 : mux_2=a_or_b;
       3'b100 : mux_2 = slt; 
       default : mux_2 = 32'h00000000;
    endcase


    assign Result=mux_2;

    // Flag assignment 
    assign Z = &(~Result);  // zeroflag

    assign N = Result[31]; //negative flag

    assign C = cout &(~ ALUControl[1]); //carry flag

    assign V = ((~ ALUControl[1]) & (A[31]^sum[31])) & (~(ALUControl[0]^A[31]^B[31]));  // Overflow flag


endmodule
