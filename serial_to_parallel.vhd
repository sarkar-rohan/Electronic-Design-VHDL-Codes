library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity serial_to_parallel is
	PORT(clk,sdi,ren:IN STD_LOGIC;
			RI:OUT STD_LOGIC;
		  data_out:OUT STD_LOGIC_VECTOR(7 downto 0));
		  
end serial_to_parallel;

architecture Behavioral of serial_to_parallel is
signal count:INTEGER range 0 to 7;
signal temp:STD_LOGIC_VECTOR(7 downto 0);
signal flag:STD_LOGIC;
begin
  capture_data:process(clk,ren,sdi)
  begin
		if(ren<='0') then
			count<=0;
			temp<=(others=>'0');
		elsif(clk'event and clk='1') then
			temp(count)<=sdi;
			if(count<7) then
				flag<='0';
				count<=count+1;
			else
				flag<='1';
				count<=0;
			end if;
		end if;
	end process;
	set_RI_and_ouput_data: process(clk,ren)
	begin
		if(ren='0') then
			RI<='0';
			data_out<=(others=>'Z');
		elsif(clk'event and clk='0') then
			if(flag='0') then
				RI<='0';
			else
				RI<='1';
				data_out<=temp;
			end if;
		end if;
	end process;
end Behavioral;

