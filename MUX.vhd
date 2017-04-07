library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
    Port ( data : in  STD_LOGIC_VECTOR (31 downto 0);
           SEUOperando : in  STD_LOGIC_VECTOR (31 downto 0);
           selImmediate : in  STD_LOGIC;
           OperandoALU : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture Behavorial of MUX is

begin

	process(data,SEUOperando,selImmediate)
	begin
		if(selImmediate = '1')then
			OperandoALU <= SEUOperando;
		else
			if(selImmediate = '0')then
				OperandoALU <= data;
			end if;
		end if;
	end process;

end Behavorial;