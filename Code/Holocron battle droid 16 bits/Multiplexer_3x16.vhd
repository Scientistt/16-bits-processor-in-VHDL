library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_3x16 is
    Port ( Selector : in  STD_LOGIC_VECTOR (2 downto 0);
           input_A, input_B, input_C, input_D, input_E, input_F, input_G, input_H: in STD_LOGIC_VECTOR (15 downto 0);
           output   : out STD_LOGIC_VECTOR (15 downto 0));
end Multiplexer_3x16;

architecture skeleton of Multiplexer_3x16 is
begin
	with Selector select
		 output <= 	input_A when "000",
						input_B when "001",
						input_C when "010",
						input_D when "011",
						input_E when "100",
						input_F when "101",
						input_G when "110",
						input_H when others;
end skeleton;