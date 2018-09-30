----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:19:19 05/12/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
Port ( clk : in  STD_LOGIC;
       data : in  STD_LOGIC;
       ps2_clk : in  STD_LOGIC;
       new_code : out  STD_LOGIC;
		 err:out std_logic;
		 sevenseg_en : out std_logic_vector (3 downto 0);
		 code : out  STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture Behavioral of main is
component ps2
Port ( clk : in  STD_LOGIC;
       ps2_data : in  STD_LOGIC;
		 ps2_clk : in  STD_LOGIC;
		 ps2_code_new : out  STD_LOGIC;
		 err:out std_logic;
		 ps2_code : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component sevenseg
port(in_data : in std_logic_vector(3 downto 0);
	  en: out std_logic_vector(3 downto 0);
	  out_data: out std_logic_vector(7 downto 0));
end component;

signal seven_en1 , seven_en2: std_logic_vector (3 downto 0);
signal sevenseg_out1 : std_logic_vector (7 downto 0);
signal sevenseg_out2 : std_logic_vector (7 downto 0);
signal ps2_out : std_logic_vector (7 downto 0);
signal temp : integer := 1 ;
begin
u1:ps2 port map(clk,data,ps2_clk,new_code,err,ps2_out);
sevenseg1 : sevenseg port map (ps2_out(7 downto 4) , seven_en1 ,sevenseg_out1) ;
sevenseg2 : sevenseg port map (ps2_out(3 downto 0) , seven_en2 ,sevenseg_out2) ;
process (clk)
begin
if (rising_edge (clk)) then
	if ( temp > 50 ) then 
		code <= sevenseg_out1 ;
		sevenseg_en <= "0010" ;
		temp <= temp + 1 ;
		if (temp = 100) then
			temp <= 1;
		end if ;
	else 
		temp <= temp + 1 ;
		code <= sevenseg_out2 ;
		sevenseg_en <= "0001" ;
	end if;
end if;
end process ;

end Behavioral;

