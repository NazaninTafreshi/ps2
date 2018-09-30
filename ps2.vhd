----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:48:58 05/04/2018 
-- Design Name: 
-- Module Name:    ps2 - Behavioral 
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

entity ps2 is
    Port ( clk : in  STD_LOGIC;
           ps2_data : in  STD_LOGIC;
           ps2_clk : in  STD_LOGIC;
           ps2_code_new : out  STD_LOGIC;
			  err:out std_logic;
           ps2_code : out  STD_LOGIC_VECTOR (7 downto 0));
end ps2;

architecture Behavioral of ps2 is
component debounce is
		PORT(
			clk     : IN  STD_LOGIC;
			button  : IN  STD_LOGIC;
			result  : OUT STD_LOGIC);
	END component;
signal db_clk:std_logic:='0';
signal db_data:std_logic:='0';

begin
u1:debounce port map(clk,ps2_clk,db_clk);
u2:debounce port map(clk,ps2_data,db_data);
process(db_clk)
variable data:std_logic_vector(10 downto 0):="00000000000";
variable i:integer:=0;
variable count:integer range 0 to 8:=0;
begin
if falling_edge(db_clk) then
	if i=0 then 
	   if ps2_data='0' then 
			ps2_code_new<='1';
			data(i):=ps2_data;
			i:=i+1;
			err<='0';
		else ps2_code_new<='0';
		     err<='1';
			  ps2_code<="00000000";
		end if;
	
	elsif (i<9)  then
		data(i):=ps2_data;
		if (data(i) xor '1' )='0' then
			count:=count+1;
      end if;
		i:=i+1;
	elsif i=9 then
	data(i):=ps2_data;
		if ps2_data='0' then
			if (count mod 2)=0 then
				err<='0';
				i:=i+1;
			else
				err<='1';
				i:=0;
			end if;
		else
			if (count mod 2) /=0 then
				err<='0';
				i:=i+1;
			else
				err<='1';
				i:=0;
			end if;			
		end if;
	elsif i=10 then
	   data(i):=ps2_data;
		if ps2_data='1' then
			ps2_code<=data(8 downto 1);
			err<='0';
		else err<='1';
		end if;
		i:=0;	
	end if;
end if;
end process;
	 
end Behavioral;

