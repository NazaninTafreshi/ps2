--------------------------------------------------------------------------------
--
--   FileName:         debounce.vhd
--   Dependencies:     none
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 3/26/2012 Scott Larson
--     Initial Public Release
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY debounce IS
  GENERIC(
    counter_size  :  INTEGER := 10); --counter size (10 bits gives 40.9us with 50MHz clock)
  PORT(
    clk     : IN  STD_LOGIC;  --input clock 50MHz
    button  : IN  STD_LOGIC;  --input signal to be debounced
    result  : OUT STD_LOGIC); --debounced signal
END debounce;

ARCHITECTURE logic OF debounce IS

BEGIN

  
  
  PROCESS(clk)
  variable flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0); --input flip flops
  variable counter_set : STD_LOGIC;                    --sync reset to zero
  variable counter_out : STD_LOGIC_VECTOR(counter_size DOWNTO 0) := (OTHERS => '0'); --counter output
  BEGIN
 
    IF(clk'EVENT and clk = '1') THEN
	  counter_set := flipflops(0) xor flipflops(1);   --determine when to start/reset counter
      flipflops(0) := button;
      flipflops(1) := flipflops(0);
      If(counter_set = '1') THEN                  --reset counter because input is changing
        counter_out := (OTHERS => '0');
      ELSIF(counter_out(counter_size) = '0') THEN --stable input time is not yet met
        counter_out := counter_out + 1;
      ELSE                                        --stable input time is met
        result <= flipflops(1);
      END IF;    
    END IF;
  END PROCESS;
END logic;
