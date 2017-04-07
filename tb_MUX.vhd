--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:17:36 04/07/2017
-- Design Name:   
-- Module Name:   C:/Users/shoyo/Desktop/xilinx/sparcv8Proyect/tb_MUX.vhd
-- Project Name:  Sparcv8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY tb_MUX IS
END tb_MUX;
 
ARCHITECTURE behavior OF tb_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         data : IN  std_logic_vector(31 downto 0);
         SEUOperando : IN  std_logic_vector(31 downto 0);
         selImmediate : IN  std_logic;
         OperandoALU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal SEUOperando : std_logic_vector(31 downto 0) := (others => '0');
   signal selImmediate : std_logic := '0';

 	--Outputs
   signal OperandoALU : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          data => data,
          SEUOperando => SEUOperando,
          selImmediate => selImmediate,
          OperandoALU => OperandoALU
        );

   
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      data <= x"00000001";
      SEUOperando <= x"00000011";
      selImmediate <= '1';
		
		
		wait for 100 ns;	

      data <= x"00000001";
      SEUOperando <= x"00000011";
      selImmediate <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
