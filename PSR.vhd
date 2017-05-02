library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;


entity PSR is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           nCWP : in  STD_LOGic;
           CWP : out  STD_LOGIC;
           Carry : out  STD_LOGIC
          
			 );
end PSR;

architecture arqPSR of PSR is


begin
	
	process(CLK,Reset,nCWP,NZVC)
	begin
		if(Reset = '1') then
			Carry <= '0';
			CWP <= '0'; 
			
		else
			if(rising_edge(CLK)) then
				Carry <= NZVC(0);
				CWP <= nCWP; 
				
			end if;
		end if;
	end process;
end arqPSR;
