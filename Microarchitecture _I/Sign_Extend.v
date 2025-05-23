module Sign_Extend (In, Imm_Ext,ImmSrc);

    input ImmSrc;
    input [31:0] In;
    output [31:0] Imm_Ext;

    assign Imm_Ext = (ImmSrc) ? ({{20{In[31]}},In[31:25],In[11:7]}):({{20{In[31]}}, In[31:20]}) ;

endmodule
