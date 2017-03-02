library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4x16 is
    Port ( 	Selector : in  STD_LOGIC_VECTOR (3 downto 0);
				input_A, input_B, input_C, input_D, input_E, input_F, input_G, input_H: in  STD_LOGIC_VECTOR (15 downto 0);
				input_I, input_J, input_K, input_L, input_M, input_N, input_O, input_P: in  STD_LOGIC_VECTOR (15 downto 0);
				output   : out STD_LOGIC_VECTOR (15 downto 0));
end Multiplexer_4x16;

architecture skeleton of Multiplexer_4x16 is
begin
	with Selector select
		 output <= 	input_A when "0000",
						input_B when "0001",
						input_C when "0010",
						input_D when "0011",
						input_E when "0100",
						input_F when "0101",
						input_G when "0110",
						input_H when "0111",
						input_I when "1000",
						input_J when "1001",
						input_K when "1010",
						input_L when "1011",
						input_M when "1100",
						input_N when "1101",
						input_O when "1110",
						input_P when others;
end skeleton;