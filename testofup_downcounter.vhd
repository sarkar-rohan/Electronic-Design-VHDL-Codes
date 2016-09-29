
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY testofup_downcounter IS
END testofup_downcounter;
 
ARCHITECTURE behavior OF testofup_downcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT up_downcounter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ce : IN  std_logic;
         up_down : IN  std_logic;
         count : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ce : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: up_downcounter PORT MAP (
          clk => clk,
          rst => rst,
          ce => ce,
          up_down => up_down,
          count => count
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst<='1';
		ce<='0';
		wait for 7ns;
		rst<='0';
		ce<='1';
		up_down<='1';
		wait for 120ns;
		up_down<='0';
		wait for 60ns;
		ce<='0';
		wait for 40ns;
		
	end process;

END;
