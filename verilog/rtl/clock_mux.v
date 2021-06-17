module clock_mux(
		 input 	clk0,
		 input 	clk1,
		 input 	sel,
		 output reg clk);

always @(*) begin
   clk = sel ? clk1 : clk0;
end

endmodule // clock_mux
