library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicalXOR_2x16 is
    Port ( 
           input_A, input_B: in STD_LOGIC_VECTOR (15 downto 0);
           output   : out STD_LOGIC_VECTOR (15 downto 0));
end LogicalXOR_2x16;

architecture skeleton of LogicalXOR_2x16 is
begin
	output <= 	input_A XOR input_B;
end skeleton;