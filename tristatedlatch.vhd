
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tristatedlatch is
	PORT(data_in: STD_LOGIC_VECTOR(7 downto 0);
			LE: IN STD_LOGIC; --Latch Enable ACTIVE HIGH
			OE: IN STD_LOGIC; --Output Enable ACTIVE HIGH
			data_out:OUT STD_LOGIC_VECTOR(7 downto 0));
end tristatedlatch;

architecture Behavioral of tristatedlatch is
signal temp1,temp2: STD_LOGIC_VECTOR(7 downto 0);
begin
	latch_data:process(LE,data_in)
	begin
		if(LE='1') then
			temp1<=data_in;
		end if;
	end process;
	data_stabilised:process(temp1,LE)
	begin
		if(LE'event and LE='0') then --on the falling edge of latch
			temp2<=temp1;
		end if;
	end process;
	output_data:process(OE,temp2)
	begin
		if(OE='1') then
			data_out<=temp2;
		else
			data_out<=(others=>'Z');
		end if;
	end process;
			

end Behavioral;

