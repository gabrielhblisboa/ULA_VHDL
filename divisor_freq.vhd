----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:26:23 05/06/2023 
-- Design Name: 
-- Module Name:    divisor_freq - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor_freq is
	port (
		clk_50MHz: in std_logic;
		--reset: in std_logic;
		clk_out: out std_logic
			);
end divisor_freq;

architecture Behavioral of divisor_freq is

	signal temporal: std_logic;
	signal contador: integer range 0 to 49999999 := 0;

begin
	dividir_clk: process (clk_50MHz) begin
		--if (reset = '1') then
			--temporal <= '0';
			--contador <= 0;
		if (rising_edge(clk_50MHz)) then
			if (contador = 49999999) then
				temporal <= not (temporal);
				contador <= 0;
			else
				contador <= contador + 1;
			end if;
		end if;
	end process;

	clk_out <= temporal;

end Behavioral;

