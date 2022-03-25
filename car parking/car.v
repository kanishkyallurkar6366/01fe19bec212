`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:52 03/10/2022 
// Design Name: 
// Module Name:    car 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module car(clk,reset_n,ent_sensor,exit_sensor,pass1,GREEN_LED,RED_LED);
input clk,reset_n,ent_sensor,exit_sensor;
input [1:0] pass1;
output wire GREEN_LED,RED_LED;

parameter idle = 3'b000, wait_pass = 3'b001, wrong_pass = 3'b010, right_pass = 3'b011;
reg[2:0] current_state, next_state;
reg[31:0] counter_wait;
reg red_tmp,green_tmp;



always @(posedge clk or negedge reset_n)
begin
if(~reset_n)
current_state = idle;
else
current_state = next_state;
end


always @(posedge clk or negedge reset_n)
begin
if(~reset_n)
counter_wait <= 0;
else if(current_state==wait_pass)
counter_wait <= counter_wait + 1;
else
counter_wait <= 0; 
end


always @(*)
begin
case(current_state)

idle: begin
if(ent_sensor == 1)
next_state = wait_pass;
else
next_state = idle;
end

wait_pass: begin
if(counter_wait <= 3)
next_state = wait_pass;
else
begin
if(pass1==2'b01)
next_state = right_pass;
else
next_state = wrong_pass;
end
end

right_pass: begin
if(ent_sensor==1 && exit_sensor == 1)
next_state = idle;
else if(exit_sensor== 1)
next_state = idle;
else
next_state = right_pass; 
end


wrong_pass: begin
if(pass1==2'b01)
next_state = right_pass;
else
next_state = wrong_pass;
end





default: next_state = idle;
endcase
end

always @(posedge clk) begin 
 case(current_state)
 idle: begin
 green_tmp = 1'b0;
 red_tmp = 1'b0;
 
 end
 
 wait_pass: begin
 green_tmp = 1'b0;
 red_tmp = 1'b1;
 
 end
 
 wrong_pass: begin
 green_tmp = 1'b0;
 red_tmp = ~red_tmp;
 
 end
 
 right_pass: begin
 green_tmp = ~green_tmp;
 red_tmp = 1'b0;
 
 end
 
 
 endcase
 end
 assign RED_LED = red_tmp  ;
 assign GREEN_LED = green_tmp;




endmodule
