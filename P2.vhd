
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity P2 is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           P2OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end P2;

architecture Behavioral of P2 is


	COMPONENT ADD
	PORT(
		add : IN std_logic_vector(31 downto 0);
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PC
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		PC_IN : IN std_logic_vector(31 downto 0);          
		PC_OUT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT IM 
	PORT(
		address : IN std_logic_vector(31 downto 0); 
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT; 

	COMPONENT CU
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT RF
	PORT(
		reset : IN std_logic;
		registerSource1 : IN std_logic_vector(4 downto 0);
		registerSource2 : IN std_logic_vector(4 downto 0);
		registerDestination : IN std_logic_vector(4 downto 0);
		dataToWrite : IN std_logic_vector(31 downto 0);          
		contentRegisterSource1 : OUT std_logic_vector(31 downto 0);
		contentRegisterSource2 : OUT std_logic_vector(31 downto 0)
		
		);
	END COMPONENT;

	COMPONENT MUX
	PORT(
		data : IN std_logic_vector(31 downto 0);
		SEUOperando : IN std_logic_vector(31 downto 0);
		selImmediate : IN std_logic;          
		OperandoALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

		COMPONENT SEU
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		simm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

		COMPONENT ALU
	PORT(
		operando1 : IN std_logic_vector(31 downto 0);
		operando2 : IN std_logic_vector(31 downto 0);
		aluOP : IN std_logic_vector(5 downto 0);
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	





	
	signal ADDtonPC, nPCtoPC, PCtoIM, ins32, ALUresult,RFtoALU,RFtoMUX,SEUtoMUX,MUXtoALU :STD_LOGIC_VECTOR (31 downto 0);
	signal ALUop1 : STD_LOGIC_VECTOR (5 downto 0);

	
	
begin

	Inst_ADD: ADD PORT MAP(
		add => X"00000001",
		input => nPCtoPC,
		output => ADDtonPC
	);
	
	Inst_nPC: PC PORT MAP(
		CLK => CLK,
		RESET => RST,
		PC_IN => ADDtonPC,
		PC_OUT => nPCtoPC
	);
	
	Inst_PC: PC PORT MAP(
		CLK => CLK,
		RESET => RST,
		PC_IN => nPCtoPC,
		PC_OUT => PCtoIM
	);
	
	Inst_IM: IM PORT MAP(
		address => PCtoIM,
		reset => RST,
		outInstruction =>ins32 
	);
	
	Inst_CU: CU PORT MAP(
		op => ins32(31 downto 30) ,
		op3 => ins32(24 downto 19),
		ALUOP => ALUop1
	);
	
	Inst_RF: RF PORT MAP(
		reset => RST,
		registerSource1 => ins32(18 downto 14) ,
		registerSource2 =>  ins32(4 downto 0) ,
		registerDestination =>  ins32(29 downto 25),
		dataToWrite => ALUresult ,
		contentRegisterSource1 => RFtoALU ,
		contentRegisterSource2 => RFtoMUX	
	);
	
	Inst_MUX: MUX PORT MAP(
		data => RFtoMUX,
		SEUOperando => SEUtoMUX,
		selImmediate => ins32(13),
		OperandoALU => MUXtoALU
	);
	
	
	Inst_SEU: SEU PORT MAP(
		simm13 => ins32(12 downto 0) ,
		simm32 => SEUtoMUX
	);
	
	Inst_ALU: ALU PORT MAP(
		operando1 => RFtoALU ,
		operando2 => MUXtoALU,
		aluOP => ALUop1 ,
		AluResult => ALUresult
	);
	
	P2OUT <= ALUresult;
	
end Behavioral;

