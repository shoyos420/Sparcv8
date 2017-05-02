----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity RF is
    Port ( 
           reset : in  STD_LOGIC;
           registerSource1 : in  STD_LOGIC_VECTOR (5 downto 0);
           registerSource2 : in  STD_LOGIC_VECTOR (5 downto 0);
           registerDestination : in  STD_LOGIC_VECTOR (5 downto 0);
          
			  dataToWrite : in STD_LOGIC_VECTOR (31 downto 0);
           contentRegisterSource1 : out  STD_LOGIC_VECTOR (31 downto 0);
           contentRegisterSource2 : out  STD_LOGIC_VECTOR (31 downto 0));
			
end RF;

architecture arqRF of RF is

	type ram_type is array (0 to 40) of std_logic_vector (31 downto 0);
	signal registers : ram_type :=(others => x"00000000");

begin

	process(reset,registerSource1,registerSource2,dataToWrite)
	begin
		
			if(reset = '1')then
				contentRegisterSource1 <= (others=>'0');
				contentRegisterSource2 <= (others=>'0');
				
				registers <= (others => x"00000000");
			else
				contentRegisterSource1 <= registers(conv_integer(registerSource1));
				contentRegisterSource2 <= registers(conv_integer(registerSource2));
				
				if(registerDestination /= "000000")then
					registers(conv_integer(registerDestination)) <= dataToWrite;
				end if;
				
			end if; 
		
	end process;
end arqRF;