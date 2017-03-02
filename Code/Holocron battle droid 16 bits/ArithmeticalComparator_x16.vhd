library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmeticalComparator_x16 is
    Port (
			opcodeComp : STD_LOGIC_VECTOR(2 downto 0);
			input_A, input_B : STD_LOGIC_VECTOR (15 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end ArithmeticalComparator_x16;

architecture skeleton of ArithmeticalComparator_x16 is

component Multiplexer_3x16 is
    Port ( Selector : in  STD_LOGIC_VECTOR (2 downto 0);
           input_A, input_B, input_C, input_D, input_E, input_F, input_G, input_H: in STD_LOGIC_VECTOR (15 downto 0);
           output   : out STD_LOGIC_VECTOR (15 downto 0));
end component;

	signal output000, output001, output010, output011, output100, output101, output111 : STD_LOGIC_Vector(15 downto 0); 

begin

	output000 <= "1111111111111111" when  (input_A = input_B)   else "0000000000000000";
	output001 <= "1111111111111111" when  (input_A /= input_B)  else "0000000000000000";
	output010 <= "1111111111111111" when  (input_A < input_B)   else "0000000000000000";
	output011 <= "1111111111111111" when  (input_A <= input_B)  else "0000000000000000";
	output100 <= "1111111111111111" when  (input_A > input_B)   else "0000000000000000";
	output101 <= "1111111111111111" when  (input_A >= input_B)  else "0000000000000000";
	output111 <= "0000000000000000";
	

F1: Multiplexer_3x16 port map (opcodeComp, output000,output001 ,output010 ,output011 ,output100 , output101, output111, output111, output);

end skeleton;