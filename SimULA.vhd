--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:20:10 05/07/2023
-- Design Name:   
-- Module Name:   /home/ise/UFRJ/2023-1/Sistemas Digitais/ULA - Copia/SimULA.vhd
-- Project Name:  ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Minha_Logica
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
 
ENTITY SimULA IS
END SimULA;
 
ARCHITECTURE behavior OF SimULA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Minha_Logica
    PORT(
         selecao : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         saida : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal selecao : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
	signal clk: std_logic;

 	--Outputs
   signal saida : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Minha_Logica PORT MAP (
          selecao => selecao,
          A => A,
          B => B,
          Cin => Cin,
          saida => saida,
          Cout => Cout
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*5;
		
		A <= "1100";
		B <= "0101";
		selecao <= "000";
		
		wait for clk_period*5;
		
		selecao <= "001";
		
		wait for clk_period*5;
		
		selecao <= "010";
		
		wait for clk_period*5;
		
		selecao <= "011";
		
		wait for clk_period*5;
		
		selecao <= "100";
		
		wait for clk_period*5;
		
		selecao <= "101";
		
		wait for clk_period*5;
		
		selecao <= "110";

      -- insert stimulus here 

      wait;
   end process;

END;
