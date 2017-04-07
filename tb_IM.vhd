--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:58:24 04/07/2017
-- Design Name:   
-- Module Name:   C:/Users/shoyo/Desktop/xilinx/sparcv8Proyect/tb_IM.vhd
-- Project Name:  Sparcv8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM
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
 
ENTITY tb_IM IS
END tb_IM;
 
ARCHITECTURE behavior OF tb_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN 
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

    

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      address <= x"00000001"; 

      -- insert stimulus here 

      wait;
   end process;

END;
