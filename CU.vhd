library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( 
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavorial of CU is

begin
	
	process(op,op3)
	
	begin
		ALUOP <= "000000";
					if(op = "10")then				
						case op3 is
							
							when "000000" => -- ADD
							Aluop <= "000000";
							
						when "010000" => --ADDcc
							Aluop <= "010000";
							
						when "001000" => --ADDX
							Aluop <= "001000";
							
							
						when "011000" => --ADDXcc
							Aluop <= "011000";
							
						when "000100" => -- SUB
							Aluop <= "000100";
							
						when "010100" => -- SUBcc
							Aluop <= "010100";
							
						when "001100" => -- SUBX
							Aluop <= "001100";
							
							
						when "011100" => -- SUBXcc
							Aluop <= "011100";
							
						when "000001" => -- AND
							Aluop <= "000001";
							
						when "010001" => -- ANDcc
							Aluop <= "010001";
							
						when "000101" => --ANDN
							Aluop <= "000101";
							
						when "010101" => --ANDNcc
							Aluop <= "010101";
							
						when "000010" => -- OR
							Aluop <= "000010";
							
						when "010010" => -- ORcc
							Aluop <= "010010";
							
						when "000110" => --ORN
							Aluop <= "000110";
							
						when "010110" => --ORNcc
							Aluop <= "010110";
							
						when "000011" => -- XOR
							Aluop <= "000011";
							
						when "010011" => -- XORcc
							Aluop <= "010011";
							
						when "000111" => -- XNOR
							Aluop <= "000111";
							
						when "010111" => -- XNORcc
							Aluop <= "010111";
							
						when "111100" => -- SAVE
							Aluop <= "111100";
							
						when "111101" => -- RESTORE
							Aluop <= "111101";
							
						
						when "100101" => --SLL
							Aluop <= "100101";
							
						when "100110" => --SRL
							Aluop <= "100110";
							
						when others => --En otros casos desconocidos
							Aluop <= "000000";
							
					end case;
				
					else
						ALUOP <= "000000";
						
					end if;
	
	end process;
end Behavorial;