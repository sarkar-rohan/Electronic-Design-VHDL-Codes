
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY testof_decoder_8bit IS
END testof_decoder_8bit;
 
ARCHITECTURE behavior OF testof_decoder_8bit IS 
 
   
 
    COMPONENT decoder_8bit
    PORT(
         decode_out : OUT  std_logic_vector(7 downto 0);
         OEbar : IN  std_logic;
         sel : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   signal OEbar : std_logic := '0';
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 
   signal decode_out : std_logic_vector(7 downto 0);
   
BEGIN
 
	
   uut: decoder_8bit PORT MAP (
          decode_out => decode_out,
          OEbar => OEbar,
          sel => sel
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
     OEbar<='1'; 
	  sel<="000";
	  wait for 10ns;
	  OEbar<='0';
	  wait for 10ns;
	  sel<="001";
	  wait for 10ns;
	  sel<="010";
	  wait for 10ns;
	  sel<="011";
	  wait for 10ns;
	  OEbar<='1';
	  wait for 7ns;
	  OEbar<='0';
	  wait for 10ns;
	  sel<="100";
	  wait for 10ns;
	  sel<="101";
	  wait for 10ns;
	  sel<="110";
	  wait for 10ns;
	  sel<="111";
	  wait for 10ns;
	  sel<="010";
	 
   end process;

END;
