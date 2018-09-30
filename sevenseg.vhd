----------------------------------------------------------------------------------
-- Company: 
-- Engineer: m_zamzameh
-- 
-- Create Date:    14:01:15 03/08/2018 
-- Design Name: 
-- Module Name:    sevenseg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg is
port(in_data : in std_logic_vector(3 downto 0);
en: out std_logic_vector(3 downto 0);
out_data: out std_logic_vector(7 downto 0));
end sevenseg;

architecture Behavioral of sevenseg is

begin
out_data<= "11000000" when in_data="0000" 
else "11111001" when in_data="0001" 
else "10100100" when in_data="0010" 
else "10110000" when in_data="0011" 
else "10011001" when in_data="0100" 
else "10010010" when in_data="0101" 
else "10000010" when in_data="0110"
else "11111000" when in_data="0111"
else "10000000" when in_data="1000"
else "10010000" when in_data="1001"
else "10100000" when in_data="1010"
else "10000011" when in_data="1011"
else "10100111" when in_data="1100"
else "10100001" when in_data="1101"
else "10000100" when in_data="1110"
else "10001110" when in_data="1111";
end Behavioral;

