module Single_Cycle_top_tb() ;
    
    reg clk=1'b0;
    reg rst;
    Single_Cycle_top Single_Cycle_top(.clk(clk),.rst(rst));

    initial begin
        $dumpfile("SinglrCycle.vcd");
        $dumpvars(0);
    end
    always
    begin
        clk = ~clk;
        #50;
    end

    initial begin
        rst=1'b0;
        #150;

        rst = 1'b1;
        #500;
        $finish;
        
    end

endmodule