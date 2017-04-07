--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:40:14 04/07/2017
-- Design Name:   
-- Module Name:   C:/Users/shoyo/Desktop/xilinx/sparcv8Proyect/tb_P2.vhd
-- Project Name:  Sparcv8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: P2
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
 
ENTITY tb_P2 IS
END tb_P2;
 
ARCHITECTURE behavior OF tb_P2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P2
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         P2OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal P2OUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P2 PORT MAP (
          CLK => CLK,
          RST => RST,
          P2OUT => P2OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		RST <= '1'; 
      -- hold reset state for 100 ns.
      wait for 20 ns;
			
		
		RST <= '0';  

      

      -- insert stimulus here 

      wait;
   end process;

END;
