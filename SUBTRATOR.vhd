----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:24:08 05/06/2023 
-- Design Name: 
-- Module Name:    SUBTRATOR - Behavioral 
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

entity SUBTRATOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado : out  STD_LOGIC_VECTOR (3 downto 0);
           overflow : out  STD_LOGIC);
end SUBTRATOR;

architecture Behavioral of SUBTRATOR is

component NOT_ULA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           E : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component BLOCO_SOMADOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

	signal iA, C2A, saida : STD_LOGIC_VECTOR (3 downto 0);
	signal carryOut1, carryOut2 : STD_LOGIC;

begin

	inverso_A: NOT_ULA port map (A, iA);

	complemento2_A: BLOCO_SOMADOR port map (iA, "0001", '0', C2A, carryOut1);

	resposta: BLOCO_SOMADOR port map (C2A, B, '0', saida, carryOut2);

	P2: process (C2A, B, saida)
	
	begin

	if (C2A(3) = B(3) and saida(3) /= C2A(3)) then
		overflow <= '1';
	
	else
		overflow <= '0';
	
	end if;

	end process;

	resultado <= saida;

end Behavioral;

