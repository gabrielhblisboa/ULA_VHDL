--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:53:03 05/07/2023
-- Design Name:   
-- Module Name:   /home/ise/UFRJ/2023-1/Sistemas Digitais/ULA - Copia/Sim_ULA.vhd
-- Project Name:  ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VetorFixo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Sim_ULA IS
END Sim_ULA;
 
ARCHITECTURE behavior OF Sim_ULA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VetorFixo
    PORT(
         clk_50MHz : IN  std_logic;
         vetor : IN  std_logic_vector(3 downto 0);
         botaoA : IN  std_logic;
         botaoB : IN  std_logic;
         botaoS : IN  std_logic;
         reset : IN  std_logic;
         Cin : IN  std_logic;
         led_A : OUT  std_logic;
         led_B : OUT  std_logic;
         led_S : OUT  std_logic;
         display_leds : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50MHz : std_logic := '0';
   signal vetor : std_logic_vector(3 downto 0) := (others => '0');
   signal botaoA : std_logic := '0';
   signal botaoB : std_logic := '0';
   signal botaoS : std_logic := '0';
   signal reset : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal led_A : std_logic;
   signal led_B : std_logic;
   signal led_S : std_logic;
   signal display_leds : std_logic_vector(3 downto 0);
   signal Cout : std_logic;

   -- Clock period definitions
   constant clk_50MHz_period : time := 20000 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VetorFixo PORT MAP (
          clk_50MHz => clk_50MHz,
          vetor => vetor,
          botaoA => botaoA,
          botaoB => botaoB,
          botaoS => botaoS,
          reset => reset,
          Cin => Cin,
          led_A => led_A,
          led_B => led_B,
          led_S => led_S,
          display_leds => display_leds,
          Cout => Cout
        );

   -- Clock process definitions
   clk_50MHz_process :process
   begin
		clk_50MHz <= '0';
		wait for clk_50MHz_period/2;
		clk_50MHz <= '1';
		wait for clk_50MHz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;

		reset <= '0';
		
      wait for clk_50MHz_period;

		vetor <= "1111";
		wait for clk_50MHz_period;
		botaoA <= '1';
		wait for clk_50MHz_period;
		botaoA <= '0';
		wait for clk_50MHz_period;
		vetor <= "0001";
		wait for clk_50MHz_period;
		botaoB <= '1';
		wait for clk_50MHz_period;
		botaoB <= '0';
		wait for clk_50MHz_period;
		vetor <= "0000";
		wait for clk_50MHz_period;
		botaoS <= '1';
		wait for clk_50MHz_period;
		botaoS <= '0';
		wait for clk_50MHz_period*10;


      wait;
   end process;
	
END;