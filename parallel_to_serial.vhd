library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity parallel_to_serial is
	port(rst,clk,le:IN STD_LOGIC;
			in8: STD_LOGIC_VECTOR(7 downto 0);
			SDO,TI,clk_out: out std_logic);
end parallel_to_serial;

architecture Behavioral of parallel_to_serial is
signal data_buffer:STD_LOGIC_VECTOR(7 downto 0);
signal count:INTEGER range 0 to 8;
signal flag:STD_LOGIC;
signal TI_BUF:STD_LOGIC;
begin
	
	process(rst,clk,LE,in8,count)
	begin	
		if(rst='1') then
			TI_BUF<='0';
			SDO<='0';
			data_buffer<=(others=>'0');
			count<=0;
		elsif(LE='1') then
				data_buffer<=in8;
				TI_BUF<='0';
				SDO<='0';
				count<=0;
		elsif(clk'event and clk='1' and count<8 and flag='1') then
				SDO<=data_buffer(count);
				count<=count+1;
		end if;
		if(count<8 and flag='1') then
			TI_BUF<='1'; --transmission in progress
		else
			TI_BUF<='0'; --transmission is complete
		end if; 
		end process;
	process(LE,rst)
	begin
		if(rst='1') then
			flag<='0';
		elsif(LE'event and LE='1') then
			flag<='1';
		end if;
	end process;
	process(TI_BUF,clk)
	begin
		if(TI_BUF='1') then
			clk_out<=clk;
		else
			clk_out<='0';
		end if;
	end process;
	
	
	TI<=TI_BUF;
end Behavioral;

				

