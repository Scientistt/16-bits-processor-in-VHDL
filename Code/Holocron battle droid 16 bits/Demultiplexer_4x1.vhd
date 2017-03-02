library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demultiplexer_4x1 is
    Port ( Selector : in  STD_LOGIC_VECTOR(3 downto 0);
           input: in  STD_LOGIC;
           output_A, output_B, output_C, output_D, output_E, output_F, output_G, output_H   : out STD_LOGIC;
			  output_I, output_J, output_K, output_L, output_M, output_N, output_O, output_P   : out STD_LOGIC);
end Demultiplexer_4x1;

architecture skeleton of Demultiplexer_4x1 is
begin
	with Selector select
		 output_A <= 	input when "0000",
							'0' when others;
	with Selector select
		 output_B <= 	input when "0001",
							'0' when others;
	with Selector select
		 output_C <= 	input when "0010",
							'0' when others;
	with Selector select
		 output_D <= 	input when "0011",
							'0' when others;
	with Selector select
		 output_E <= 	input when "0100",
							'0' when others;
	with Selector select
		 output_F <= 	input when "0101",
							'0' when others;
	with Selector select
		 output_G <= 	input when "0110",
							'0' when others;
	with Selector select
		 output_H <= 	input when "0111",
							'0' when others;
	with Selector select
		 output_I <= 	input when "1000",
							'0' when others;
	with Selector select
		 output_J <= 	input when "1001",
							'0' when others;
	with Selector select
		 output_K <= 	input when "1010",
							'0' when others;
	with Selector select
		 output_L <= 	input when "1011",
							'0' when others;
	with Selector select
		 output_M <= 	input when "1100",
							'0' when others;
	with Selector select
		 output_N <= 	input when "1101",
							'0' when others;
	with Selector select
		 output_O <= 	input when "1110",
							'0' when others;
	with Selector select
		 output_P <= 	input when "1111",
							'0' when others;
end skeleton;