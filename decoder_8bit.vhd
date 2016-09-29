
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder_8bit is
	PORT(decode_out: OUT STD_LOGIC_VECTOR(7 downto 0);
		OEbar: IN STD_LOGIC;
		sel: IN STD_LOGIC_VECTOR(2 downto 0));
end decoder_8bit;

architecture Behavioral of decoder_8bit is
begin  
		decode_out<=(others=>'Z') when OEbar='1' else
					 "11111110" when sel="000" else
					 "11111101" when sel="001" else
					 "11111011" when sel="010" else
					 "11110111" when sel="011" else
					 "11101111" when sel="100" else
					 "11011111" when sel="101" else
					 "10111111" when sel="110" else
					 "01111111";
end Behavioral;

