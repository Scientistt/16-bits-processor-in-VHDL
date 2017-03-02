library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_2x1 is
    Port ( Selector : in  STD_LOGIC_VECTOR (1 downto 0);
           input_A, input_B, input_C, input_D: in  STD_LOGIC;
           output   : out STD_LOGIC);
end Multiplexer_2x1;

architecture skeleton of Multiplexer_2x1 is
begin
	with Selector select
		 output <= 	input_A when "00",
						input_B when "01",
						input_C when "10",
						input_D when others;
end skeleton;