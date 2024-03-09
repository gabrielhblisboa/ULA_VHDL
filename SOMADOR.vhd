----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:56:54 05/05/2023 
-- Design Name: 
-- Module Name:    SOMADOR - Behavioral 
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

entity BLOCO_SOMADOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end BLOCO_SOMADOR;

architecture Behavioral of BLOCO_SOMADOR is

signal c: STD_LOGIC_VECTOR (3 downto 0);

component SOMA_ULA 
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

begin

S0: SOMA_ULA port map(A(0), B(0), Cin, soma(0), c(0));
S1: SOMA_ULA port map(A(1), B(1), c(0), soma(1), c(1));
S2: SOMA_ULA port map(A(2), B(2), c(1), soma(2), c(2));
S3: SOMA_ULA port map(A(3), B(3), c(2), soma(3), Cout);

end Behavioral;

