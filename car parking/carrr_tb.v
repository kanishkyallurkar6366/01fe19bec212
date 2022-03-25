`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:03 03/11/2022
// Design Name:   car
// Module Name:   C:/project/car_parking/carrr_tb.v
// Project Name:  car_parking
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: car
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module carrr_tb;

	
	reg clk;
	reg reset_n;
	reg ent_sensor;
	reg exit_sensor;
	reg [1:0] pass1;
	
	
	wire GREEN_LED;
	wire RED_LED;

	
	car uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.ent_sensor(ent_sensor), 
		.exit_sensor(exit_sensor), 
		.pass1(pass1), 
		.GREEN_LED(GREEN_LED), 
		.RED_LED(RED_LED)
	);

	initial begin
		
		clk = 0;
		reset_n = 0;
		ent_sensor = 0;
		exit_sensor = 0;
		pass1 = 0;
	

		
		#100;
		
      reset_n = 1;
 #20;
 ent_sensor = 1;
 #1000;
 exit_sensor = 0;
 pass1 = 1;
 #2000;
 exit_sensor =1;
        
		
	end
      
endmodule

