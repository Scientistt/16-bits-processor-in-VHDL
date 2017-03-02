library ieee;
use ieee.std_logic_1164.all;

entity ALU_x16 is 
	port (
		opcode : IN STD_LOGIC_VECTOR(3 downto 0);
		negate : IN STD_LOGIC;
		input_A, input_B : IN STD_LOGIC_VECTOR(15 downto 0);
		output, overflowMultDiv : OUT STD_LOGIC_VECTOR(15 downto 0)
	);	
end ALU_x16;
	
architecture skeleton of ALU_x16 is 

	component Multiplexer_4x16 is
		 Port ( 	Selector : in  STD_LOGIC_VECTOR (3 downto 0);
					input_A, input_B, input_C, input_D, input_E, input_F, input_G, input_H: in  STD_LOGIC_VECTOR (15 downto 0);
					input_I, input_J, input_K, input_L, input_M, input_N, input_O, input_P: in  STD_LOGIC_VECTOR (15 downto 0);
					output   : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component Adder_2x16 is 
		port (
			isSubtraction: in STD_LOGIC;
			input_A, input_B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
			carry_out: out STD_LOGIC;
			output: out STD_LOGIC_VECTOR(15 DOWNTO 0));
	end component;
	
	component ArithmeticalRightShifter_x16 is
		 Port (
				input : STD_LOGIC_VECTOR (15 downto 0);
				output : out STD_LOGIC_VECTOR (15 downto 0));
	end component;


	component LogicalRightShifter_x16 is
		 Port (
				input : STD_LOGIC_VECTOR (15 downto 0);
				output : out STD_LOGIC_VECTOR (15 downto 0));
	end component;

	component ArithmeticalLogicalLeftShifter_x16 is
		 Port (
				input : STD_LOGIC_VECTOR (15 downto 0);
				output : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component ArithmeticalComparator_x16 is
		 Port (
				opcodeComp : STD_LOGIC_VECTOR(2 downto 0);
				input_A, input_B : STD_LOGIC_VECTOR (15 downto 0);
				output : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component Multiplier_2x16 is
		Port (
				input_A, input_B : in STD_LOGIC_VECTOR (15 downto 0);
				outputLow, outputHigh : out STD_LOGIC_VECTOR (15 downto 0);
				carryOut : out STD_LOGIC);
	end component;
	
	component Divider_2x16 is
		Port (
				input_A, input_B : in STD_LOGIC_VECTOR (15 downto 0);
				outputLow, outputHigh : out STD_LOGIC_VECTOR (15 downto 0);
				carryOut : out STD_LOGIC);
	end component;
	
	component LogicalAND_2x16 is
		 Port ( 
				  input_A, input_B: in STD_LOGIC_VECTOR (15 downto 0);
				  output   : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component LogicalOR_2x16 is
		 Port ( 
				  input_A, input_B: in STD_LOGIC_VECTOR (15 downto 0);
				  output   : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component LogicalXOR_2x16 is
		 Port ( 
				  input_A, input_B: in STD_LOGIC_VECTOR (15 downto 0);
				  output   : out STD_LOGIC_VECTOR (15 downto 0));
	end component;		

	signal output1, output2, output3, output4, output5, output6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal output7, outputComparator : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal output14, output15, output0, outputand, outputor, outputxor : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	
	signal carryoutMul, carryoutDiv, carryoutAddSub : STD_LOGIC;
	signal overMult, overDiv : STD_LOGIC_VECTOR(15 downto 0);
	
begin

	-- 0000
	-- 12
	-- Soma e Subtração
	P0: Adder_2x16 port map(negate, input_A, input_B, carryoutAddSub, output0);
	
	-- 0001
	-- Retorna o segundo valor
	output1 <= input_B;
	
	P2: LogicalAND_2x16 port map(input_A, input_B, outputand);
	P3: LogicalOR_2x16 port map(input_A, input_B, outputor);
	P4: LogicalXOR_2x16 port map(input_A, input_B, outputxor);
	
	process(input_A, input_B) begin
		
	if(negate = '0') 
	then
		-- 0010
		-- 1
		-- And
		output2 <= outputand;
		
		-- 0011
		-- 1
		-- Or
		output3 <= outputor;
		
		-- 0100
		-- 1
		-- Xor
		output4 <= outputxor;
	else
		-- 0010
		-- 1
		-- Nand
		output2 <= not outputand;
		
		-- 0011
		-- 1
		-- Nor
		output3 <= not outputor;
		
		-- 0100
		-- 1
		-- Xnor
		output4 <= not outputxor;
	
	end if;
	
	
	if(opcode(0) = '0') then
		overflowMultDiv <= overMult;
	else
		overflowMultDiv <= overDiv;
	end if;
	
	
	end process;
	
	-- 0101
	-- Shift aritmetico para direita
	P5: ArithmeticalRightShifter_x16 port map(input_A, output5);
	
	-- 0110
	-- Shift logico para direita
	P6: LogicalRightShifter_x16 port map(input_A, output6);
	
	-- 0111
	-- Shift aritmetico e logico para esquerda
	P7: ArithmeticalLogicalLeftShifter_x16 port map(input_A, output7);
	
	-- 1000
	-- Comparadores
	P8: ArithmeticalComparator_x16 port map(opcode(2 downto 0), input_A, input_B, outputComparator);
	
	-- 1110
	-- 12
	-- Multiplicação
	p14: Multiplier_2x16 port map(input_A, input_B, output14, overMult, carryoutMul);
	
	-- 1111
	-- 12
	-- Divisão
	p15: Divider_2x16 port map(input_A, input_B, output15, overDiv, carryoutDiv);
		
	
	Poutput: Multiplexer_4x16 port map (opcode, output0, output1, output2, output3, output4, output5, output6,
														output7, outputComparator, outputComparator, outputComparator, 
														outputComparator, outputComparator,
														outputComparator, output14, output15, output);

end skeleton;