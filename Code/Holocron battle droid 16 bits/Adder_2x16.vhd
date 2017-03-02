library ieee;
use ieee.std_logic_1164.all;

entity Adder_2x16 is 
	port (
	isSubtraction: in STD_LOGIC;
	input_A, input_B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	carry_out: out STD_LOGIC;
	output: out STD_LOGIC_VECTOR(15 DOWNTO 0));
end Adder_2x16;
	
architecture skeleton of Adder_2x16 is 
begin 
	process(input_A, input_B, isSubtraction)
	
	variable sum, bOrNotb : STD_LOGIC_VECTOR(15 downto 0);
	variable carry : STD_LOGIC; 
	
	begin
		
	if (isSubtraction = '1') then
		bOrNotb :=  NOT input_B;
	else
		bOrNotb :=  input_B;
	end if;
		
	carry := isSubtraction;
	
	for i in 0 to 15 loop
		sum(i) := input_A(i) xor bOrNotb(i) xor carry;
		carry := (input_A(i) and bOrNotb(i)) or ((input_A(i) xor bOrNotb(i)) and carry);
	end loop;
	
	carry_out <= carry;
	output <= sum;
	
	end process;
end skeleton;