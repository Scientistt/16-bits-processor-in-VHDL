library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Holocron_BattleDroid16bits is

port( 
	clock : in std_logic
 );
    
end Holocron_BattleDroid16bits;

architecture skeleton of Holocron_BattleDroid16bits is

-- Program Counter
component ProgramCounterRegister_x16 is 
	port (
	clock : in STD_LOGIC;
	input: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	output: out STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

-- Memória de Instruções
component ROMMemory_x16 is
	port(
	address : in  std_logic_vector(15 downto 0);
	data: out std_logic_vector(15 downto 0));
end component;

-- Unidade de Controle
component ControlUnity_x16 is 
	port (
		opcode : in STD_LOGIC_VECTOR(4 downto 0);
		funct : in STD_LOGIC_VECTOR(2 downto 0);	
		ulaop, reg1w, reg1r : out std_logic_vector(3 downto 0);
		wr1, wr2, regOrNum, row, dvc, sri, memOrUla : out std_logic;
		bool : out std_logic_vector(1 downto 0));
end component;

-- Banco de Registradores
component RegisterBank_4x16 is 
	port (
	clock, clear, writeRegister1, writeRegister2: in STD_LOGIC;
	registerAddress1, registerAddress2, register1Read, register1Write: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	inputedDataR1, inputedDataR2 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
	readData1, readData2: out STD_LOGIC_VECTOR(15 DOWNTO 0)	
	);
end component;


-- Unidade Lógico aritmética
component ALU_x16 is 
	port (
		opcode : IN STD_LOGIC_VECTOR(3 downto 0);
		negate : IN STD_LOGIC;
		input_A, input_B : IN STD_LOGIC_VECTOR(15 downto 0);
		output, overflowMultDiv : OUT STD_LOGIC_VECTOR(15 downto 0)
	);	
end component;

-- Memória de Dados
component RAMMemory_x16 is
  port (
    clock   : in  std_logic;
    write_memory      : in  std_logic;
    address : in  std_logic_vector(15 downto 0);
    input_data  : in  std_logic_vector(15 downto 0);
    output_data : out std_logic_vector(15 downto 0)
  );
end component;

-- Extensor de sinal de 11 para 16 bits
component SignalExtender_11x16 is
    Port (
			input : STD_LOGIC_VECTOR (10 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Extensor de sinal de 4 para 16 bits
component SignalExtender_4x16 is
    Port (
			input : STD_LOGIC_VECTOR (3 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Multiplexador com 1 bit de seleção para 16 bits
component Multiplexer_1x16 is
    Port ( Selector : in  STD_LOGIC;
           input_A, input_B: in  STD_LOGIC_VECTOR (15 downto 0);
           output   : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Encurtador de sinal de 16 para 1 bit
component SignalShorter_16x1 is
    Port (
			input : STD_LOGIC_VECTOR (15 downto 0);
			output : out STD_LOGIC);
end component;

-- Multiplexador com 2 bits de seleção para 1 bit
component Multiplexer_2x1 is
    Port ( Selector : in  STD_LOGIC_VECTOR (1 downto 0);
           input_A, input_B, input_C, input_D: in  STD_LOGIC;
           output   : out STD_LOGIC);
end component;

-- Somador de 16 bits
component Adder_2x16 is 
	port (
	isSubtraction: in STD_LOGIC;
	input_A, input_B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	carry_out: out STD_LOGIC;
	output: out STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;



--




-- Fiação
-- 16 bits
signal nextIntructionToPc, pcToROM, actualInstruction, resultadoDado1, resultadoDado2HighMultDiv, register1Value, register2Value : STD_LOGIC_vector(15 downto 0);
signal jumpDirectAddress, addressTojumpTo, register2DirectValue, trueRegister2Value, outputALU, outputMemory, possibleNextInstruction : std_logic_vector(15 downto 0);
signal maybeTheNextInstruction, nextInstructionWithJump : std_logic_vector(15 downto 0);

-- 4 bits
signal ulaOpcode, registerToWriteIn, regiteToReadFrom, register1Address, register2Address : STD_LOGIC_VECTOR(3 downto 0);

-- 2 bits
signal registerBoolOrNot : std_logic_vector(1 downto 0);

-- 1  bit
signal writeRegister1, writeRegister2, register2orNumber, readOrWriteFromMemory, conditionalJump, registerOrImediateJump : std_logic;
signal outputFromMemoryOrFromUla, regiterBoolValue, boolApproveMultiplexer, shouldJumpNow, dontCarePcAdder, dontCareJumpSubtractor : std_logic;
signal dontCareAddressSum : std_logic;

begin
	
	-- Controle de instruções.
	COM1 : 	ProgramCounterRegister_x16 port map(clock, nextIntructionToPc, pcToROM);
	
	-- Memória De instruções.
	COM2 : 	ROMMemory_x16 port map(pcToROM, actualInstruction);
	
	-- Unidade de Controle.
	COM3 :	ControlUnity_x16 port map(actualInstruction(15 downto 11), actualInstruction(2 downto 0), ulaOpcode, registerToWriteIn, 
				regiteToReadFrom, writeRegister1, writeRegister2, register2orNumber, readOrWriteFromMemory, conditionalJump, 
				registerOrImediateJump, outputFromMemoryOrFromUla, registerBoolOrNot);
				
	-- Banco de Registradores.
	COM4 :	RegisterBank_4x16 port map(clock, '0', writeRegister1, writeRegister2, 
				actualInstruction(10 downto 7), actualInstruction(6 downto 3),
				regiteToReadFrom, registerToWriteIn, resultadoDado1, 
				resultadoDado2HighMultDiv, register1Value, register2Value);

	-- Extensor de sinal do endereço de salto condicional direto.	
	EXT1 :	SignalExtender_11x16 port map(actualInstruction(10 downto 0), jumpDirectAddress);
		
	-- Multiplexador endereço direto ou o valor do registrador.
	MUX1 :	Multiplexer_1x16 port map(registerOrImediateJump, register2Value, jumpDirectAddress, addressTojumpTo);
	
	-- Extensor de sinal que pega o endereço literal do segundo regsitardor como constante.
	EXT2 :	SignalExtender_4x16 port map(actualInstruction(6 downto 3), register2DirectValue);
	
	-- Multiplexador que seleciona o valor que estava no registrador2 ou o seu valor como constante - direto.
	MUX2 : 	Multiplexer_1x16 port map(register2orNumber, register2Value, register2DirectValue, trueRegister2Value);
	
	-- Unidade Lógica e aritmética.
	COM5 :	ALU_x16 port map(ulaOpcode, actualInstruction(0), register1Value, trueRegister2Value, outputALU, resultadoDado2HighMultDiv);
		
	-- Memória de Dados RAM.
	COM6 : 	RAMMemory_x16 port map(clock, readOrWriteFromMemory, trueRegister2Value, register1Value, outputMemory);
		
	-- Multiplexador que seleciona se o valor gravado será o da ULA ou o da memória.
	MUX3 :	Multiplexer_1x16 port map(outputFromMemoryOrFromUla, outputMemory, outputALU, resultadoDado1);
	
	-- Encurtador de sinal que pega o valor do registrador BOOl e transforma em 1 bit.
	SHT1 :	SignalShorter_16x1 port map(register1Value, regiterBoolValue);
	
	-- Multiplexador que seleciona se o salto condicional depende do valor de BOOl, ~BOOl ou não.
	MUX4 :	Multiplexer_2x1 port map(registerBoolOrNot, not regiterBoolValue, '1', '1', regiterBoolValue, boolApproveMultiplexer);
	
	-- Checando para confirmar que haverá um salto condicional.
	shouldJumpNow <= boolApproveMultiplexer AND conditionalJump;
	
	-- Somador automático para a próxima instrução.
	COM7 :	Adder_2x16 port map('0', pcToROM, "0000000000000001", dontCarePcAdder, possibleNextInstruction);
	
	-- Somador que retira a soma automática do PC para calcular o novo endereço depois do salto.
	COM8 :	Adder_2x16 port map('1', addressTojumpTo, "0000000000000001", dontCareJumpSubtractor, maybeTheNextInstruction);
	
	-- Somador que Calcula o endereço da próxima instrução.
	COM9 :	Adder_2x16 port map('0', possibleNextInstruction, maybeTheNextInstruction, dontCareAddressSum, nextInstructionWithJump);
	
	-- Multiplexador que seleciona o endereço da próxima instrução natural ou com salto. 
	MUX5 :	Multiplexer_1x16 port map(shouldJumpNow, possibleNextInstruction, nextInstructionWithJump, nextIntructionToPc);
		
end skeleton;