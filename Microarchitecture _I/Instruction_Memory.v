module Instr_Mem (A,rst,RD);

input [31:0] A;
input rst;
output [31:0] RD;

reg [31:0] Mem [1023:0];
 
assign RD = (rst==1'b0)? {32{1'b0}} : Mem [A[31:0]];

initial begin

 Mem[0] = 32'hFFC4A303;
Mem[1] = 32'h00832383;
    // Mem[0] = 32'h0064A423;
    // Mem[1] = 32'h00B62423;
    // Mem[0] = 32'h0062E233;
    // Mem[1] = 32'h00B62423;

end



    
endmodule