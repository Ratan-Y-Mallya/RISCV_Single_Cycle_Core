module Data_Menmory ( A,WD,clk,WE,RD,rst);
    
input [31:0] A,WD;
input clk,WE,rst;

output [31:0]RD;

reg [31:0] Data_mem[1023:0];

// read
assign RD = (~rst) ?  32'h00000000 : Data_mem[A] ;

// write
always @(posedge clk) begin

    if (WE) begin
        Data_mem[A] <= WD;
    end
    
end

initial begin
    Data_mem[28] = 32'h00000020;
    Data_mem[40] = 32'h00000002;
end

endmodule