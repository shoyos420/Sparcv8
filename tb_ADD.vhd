--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:48:26 04/07/2017
-- Design Name:   
-- Module Name:   C:/Users/shoyo/Desktop/xilinx/sparcv8Proyect/tb_ADD.vhd
-- Project Name:  Sparcv8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD
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
 
ENTITY tb_ADD IS
END tb_ADD;
 
ARCHITECTURE behavior OF tb_ADD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD
    PORT(
         add : IN  std_logic_vector(31 downto 0);
         input : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal add2: std_logic_vector(31 downto 0) := (others => '0');
   signal input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD PORT MAP (
          add => add2,
          input => input,
          output => output
        );

   
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		add2 <= x"00000004";
      input <= "00000000000000000000000000000000";
      
      

      -- insert stimulus here 

      wait;
   end process;

END;
