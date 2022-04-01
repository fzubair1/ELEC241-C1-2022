module task2_tb;

// Add internal signals here

//input signals
logic CLK, n_RESET;


//output signals
logic [15:0] Q;

parameter N = 16'b1010110011100001;
int counter = 0;

task2 o1 ( Q , CLK , n_RESET );

task passed0;
		$display( "initial correct" );										// displays "initial passed" if value 0 is correct
endtask : passed0


task passed1;
		$display( "value 1 correct" );										// displays "value 1 passed" if value 1 is correct
endtask : passed1


task passed2;
		$display( "value 2 correct" );										// displays "value 2 passed" if value 2 is correct 
endtask : passed2


task passed3;
		$display( "value 3 correct" );										// displays "value 3 passed" if value 3 is correct
endtask : passed3


task passed4;
		$display( "full loop correct" );										// displays "full loop correct" if all the values are correct
endtask : passed4


task failed;
		$display( "Failed" );													// displays "Failed" if the numbers values are different
endtask : failed


initial begin

//Write testbench here

n_RESET = 0																			// resets the signal
#1ps
n_RESET = 1

	CLK = 0																		   // clock starts at 0
		repeat( 131070 )															// repeats 2x 65535 times as each period is 2ps 
			#1ps
			CLK = ~ CLK																// inverts cloc kvalue
			#1ps
			CLK = ~ CLK
end

always@( posedge CLK ) begin
							if ( counter == 0 )
								assert ( Q == N ) passed0(); else failed();
							else if (counter == 1)
								assert ( Q == 16b'1110001001110000 ) passed1(); else failed();
							else if (counter == 2)
								assert ( Q == 16b'0111000100111000 ) passed2(); else failed();
							else if (counter == 3)
								assert ( Q == 16b'0011100010011100 ) passed3(); else failed();
							else if (counter == 65535)
								assert ( Q == N ) passed4(); else failed();
							counter = counter + 1;
							
							

end

endmodule
