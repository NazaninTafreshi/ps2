--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:07:05 05/05/2018
-- Design Name:   
-- Module Name:   F:/fpgaProject/ps2/ps2_test.vhd
-- Project Name:  ps2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ps2
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
 
ENTITY ps2_test IS
END ps2_test;
 
ARCHITECTURE behavior OF ps2_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ps2
    PORT(
         clk : IN  std_logic;
         ps2_data : IN  std_logic;
         ps2_clk : IN  std_logic;
         ps2_code_new : OUT  std_logic;
         err : OUT  std_logic;
         ps2_code : OUT  std_logic_vector(0 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ps2_data : std_logic := '0';
   signal ps2_clk : std_logic := '0';

 	--Outputs
   signal ps2_code_new : std_logic;
   signal err : std_logic;
   signal ps2_code : std_logic_vector(0 to 7);

  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ps2 PORT MAP (
          clk => clk,
          ps2_data => ps2_data,
          ps2_clk => ps2_clk,
          ps2_code_new => ps2_code_new,
          err => err,
          ps2_code => ps2_code
        );
	

  clk<= not clk after 20 ns;
  ps2_clk<=not ps2_clk after 40 us;
  ps2_data<='0' after 40 us ,
				'1' after 120 us,'0' after 200 us,'1' after 280 us,'0' after 360 us,'1' after 440 us,'0' after 520 us,'1' after 600 us,'0' after 680 us,
				'0' after 760 us,
				'1' after 840 us;
END;
