module Data_Menmory ( A,WD,clk,WE,RD);
    
input [31:0] A,WD;
input clk,WE;

output [31:0]RD;

reg [31:0] Data_mem[1023:0];

// read
assign RD = (!WE) ? Data_mem[A] : 32'h00000000;

// write
always @(posedge clk) begin

    if (WE) begin
        Data_mem[A] <= WD;
    end
    
end



endmodule