library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;

entity up_downcounter is
	port(clk,rst,ce,up_down: IN STD_LOGIC;
			count:OUT STD_LOGIC_VECTOR(7 downto 0));
end up_downcounter;

architecture Behavioral of up_downcounter is
signal count_buf:STD_LOGIC_VECTOR(7 downto 0);
begin
	process(clk,rst,ce)
	begin
		if(rst='1') then
			count_buf<=(others=>'0');
		elsif(clk'event and clk='1' and ce='1') then
			if(up_down='1') then
				count_buf<=count_buf+1;
			else
				count_buf<=count_buf-1;
			end if;
		end if;
	end process;
	count<=count_buf;
	

end Behavioral;

