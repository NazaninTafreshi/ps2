--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:41:48 05/12/2018
-- Design Name:   
-- Module Name:   F:/fpgaProject/ps2/main_test.vhd
-- Project Name:  ps2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY main_test IS
END main_test;
 
ARCHITECTURE behavior OF main_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         data : IN  std_logic;
         ps2_clk : IN  std_logic;
         new_code : OUT  std_logic;
         err : OUT  std_logic;
         sevenseg_en : OUT  std_logic_vector(3 downto 0);
			code : out  STD_LOGIC_VECTOR (0 to 7));
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal data : std_logic := '0';
   signal ps2_clk : std_logic := '0';

 	--Outputs
   signal new_code : std_logic;
   signal err : std_logic;
   signal sevenseg_en : std_logic_vector(3 downto 0);
   signal code :   STD_LOGIC_VECTOR (0 to 7);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
          data => data,
          ps2_clk => ps2_clk,
          new_code => new_code,
          err => err,
          sevenseg_en => sevenseg_en,
			 code =>code);

  clk<= not clk after 20 ns;
  ps2_clk<=not ps2_clk after 40 us;
  data<='0' after 40 us ,
				'1' after 120 us,'0' after 200 us,'1' after 280 us,'0' after 360 us,'1' after 440 us,'0' after 520 us,'1' after 600 us,'0' after 680 us,
				'0' after 760 us,
				'1' after 840 us;

END;
