library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_1x4 is
    Port ( Selector : in  STD_LOGIC;
           input_A, input_B: in  STD_LOGIC_VECTOR (3 downto 0);
           output   : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplexer_1x4;

architecture skeleton of Multiplexer_1x4 is
begin
	with Selector select
		 output <= 	input_A when '0',
						input_B when others;
end skeleton;