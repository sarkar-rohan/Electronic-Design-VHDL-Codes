LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY testofparallel_to_serial IS
END testofparallel_to_serial;
 
ARCHITECTURE behavior OF testofparallel_to_serial IS 
 
    
 
    COMPONENT parallel_to_serial
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         le : IN  std_logic;
         in8 : IN  std_logic_vector(7 downto 0);
         SDO : OUT  std_logic;
			clk_out : OUT STD_LOGIC;
         TI : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal le : std_logic := '0';
	signal in8 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal SDO : std_logic;
   signal TI : std_logic;
	signal clk_out : std_logic := '0';
   -- Clock period definitions
   constant clk_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parallel_to_serial PORT MAP (
          rst => rst,
          clk => clk,
          le => le,
          in8 => in8,
          SDO => SDO,
          TI => TI
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 


   stim_proc: process
   begin		
      rst<='1';
		wait for 100ns;
		rst<='0';
		in8<="01101001";
		LE<='1';
		wait for 56ns;
		LE<='0';
		wait for 1us;
		in8<="10011101";
		LE<='1';
		wait for 16ns;
		LE<='0';
		wait;
   end process;

END;
