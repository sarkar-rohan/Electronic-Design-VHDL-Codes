
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_of_s2p IS
END test_of_s2p;
 
ARCHITECTURE behavior OF test_of_s2p IS 
 
   
 
    COMPONENT serial_to_parallel
    PORT(
         clk : IN  std_logic;
         sdi : IN  std_logic;
         ren : IN  std_logic;
         RI : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sdi : std_logic := '0';
   signal ren : std_logic := '0';

 	--Outputs
   signal RI : std_logic;
   signal data_out : std_logic_vector(7 downto 0);

   
 
BEGIN
 
   uut: serial_to_parallel PORT MAP (
          clk => clk,
          sdi => sdi,
          ren => ren,
          RI => RI,
          data_out => data_out
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      ren<='0';
		clk<='0';
		wait for 10ns;
		ren<='1';
		wait for 7ns;
		
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 50ns;
		
		
		--second serial data
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='0';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait for 10ns;
		clk<='1';
		sdi<='1';
		wait for 10ns;
		clk<='0';
		wait;
		
   end process;

END;
