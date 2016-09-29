LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY test_tristatedlatch IS
END test_tristatedlatch;
 
ARCHITECTURE behavior OF test_tristatedlatch IS 
 
   
 
    COMPONENT tristatedlatch
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         LE : IN  std_logic;
         OE : IN  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

  
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal LE : std_logic := '0';
   signal OE : std_logic := '0';

 
   signal data_out : std_logic_vector(7 downto 0);
   
 
BEGIN
 
	
   uut: tristatedlatch PORT MAP (
          data_in => data_in,
          LE => LE,
          OE => OE,
          data_out => data_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
		OE<='0';
		LE<='0';
      data_in<="11010010";
		wait for 7ns;
		LE<='1';
		wait for 10ns;
		LE<='0';
		OE<='1';
		data_in<="11000101";
		wait for 30ns;
		LE<='1';
		wait for 25ns;
		LE<='0';
		wait for 60ns;
		OE<='0';
		wait for 45ns;
		OE<='1';
		wait;

     
      

      wait;
   end process;

END;
