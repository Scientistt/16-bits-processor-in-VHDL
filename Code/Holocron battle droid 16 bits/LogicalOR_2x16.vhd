library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicalOR_2x16 is
    Port ( 
           input_A, input_B: in STD_LOGIC_VECTOR (15 downto 0);
           output   : out STD_LOGIC_VECTOR (15 downto 0));
end LogicalOR_2x16;

architecture skeleton of LogicalOR_2x16 is
begin
	output <= 	input_A OR input_B;
end skeleton;