library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluOP : in  STD_LOGIC_VECTOR (5 downto 0);
           carry : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end ALU;

architecture arqALU of ALU is

begin

	process(operando1,operando2,aluOP,carry)
	begin
	   case (aluOP) is 
			when "000000" => --add
				AluResult <= operando1 + operando2;
			when "000100" => --sub
				AluResult <= operando1 - operando2;
			when "000001" => --and
				AluResult <= operando1 and operando2;
			when "010001" => --andCC
				AluResult <= operando1 and operando2;
			when "000101" => --andN
				AluResult <= not(operando1 and operando2);
			when "000010" => --or
				AluResult <= operando1 or operando2;
			when "010010" => --orCC
				AluResult <= operando1 or operando2;
			when "000110" => --orN
				AluResult <= not(operando1 or operando2);
			when "010110" => --orNcc
				AluResult <= not(operando1 or operando2);
			when "001000" =>--addx (suma con carry)
				AluResult <= operando1 + operando2 + carry;
			when "010000" => -- addcc
				AluResult <= operando1 + operando2;
			when "011000" => -- addxcc
				AluResult <= operando1 + operando2 + carry;
			when "010100" => --subcc
				AluResult <= operando1 - operando2;
			when "001100" => --subX
				AluResult <= operando1 - operando2 - carry;	
			when "011100" => --subXCC
				AluResult <= operando1 - operando2 - carry;
			when "000011" => --xor
				AluResult <= operando1 xor operando2;
			when "010011" => --xorCC
				AluResult <= operando1 xor operando2;
			when "000111" => --xnor
				AluResult <= not(operando1 xor operando2);
			when "010111" => --xnorCC
				AluResult <= not(operando1 xor operando2);
			when "100101" => --SLL
			   AluResult <= to_stdlogicvector(to_bitvector(operando1) SLL conv_integer(operando2));
			when "100110" => --SRL
				AluResult<= to_stdlogicvector(to_bitvector(operando1) SRL conv_integer(operando2));
			
			when "111100" => --save 
				AluResult <= operando1 + operando2;
			when "111101" => --restore
				AluResult <= operando1 + operando2;
			
			when others =>
				AluResult <= x"00000000"; --operacion no configurada
		end case;
	end process;
end arqALU;
