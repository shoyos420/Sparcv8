--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:23:27 04/07/2017
-- Design Name:   
-- Module Name:   C:/Users/shoyo/Desktop/xilinx/sparcv8Proyect/tb_ALU.vhd
-- Project Name:  Sparcv8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         operando1 : IN  std_logic_vector(31 downto 0);
         operando2 : IN  std_logic_vector(31 downto 0);
         aluOP : IN  std_logic_vector(5 downto 0);
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operando1 : std_logic_vector(31 downto 0) := (others => '0');
   signal operando2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluOP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          operando1 => operando1,
          operando2 => operando2,
          aluOP => aluOP,
          AluResult => AluResult
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		operando1 <= x"00000001";
      operando2 <= x"00000001";
      aluOP <= "000000";
		
		wait for 100 ns;	
		operando1 <= x"00000001";
      operando2 <= x"00000001";
      aluOP <= "000100";
      
		wait for 100 ns;	
		operando1 <= x"00000001";
      operando2 <= x"00000001";
      aluOP <= "000010";

      -- insert stimulus here 

      wait;
   end process;

END;
