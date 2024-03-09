----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:24:34 05/06/2023 
-- Design Name: 
-- Module Name:    MULTIPLICADOR - Behavioral 
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

entity MULTIPLICADOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           saidaMult : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC);
end MULTIPLICADOR;

architecture Behavioral of MULTIPLICADOR is

signal vetor1, vetor2, vetor3, vetor4: STD_LOGIC_VECTOR (3 downto 0);

signal soma1, soma2, resultado, c: STD_LOGIC_VECTOR (3 downto 0);

component BLOCO_SOMADOR
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

component SOMA_ULA 
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

begin

	P1: process (vetor1, vetor2, vetor3, vetor4, A, B)
	
	begin
	
		if (B(0) = '0') then
			vetor1 <= "0000";
		
		elsif (B(0) = '1') then
			vetor1 <= A;
			
		end if;
		
		if (B(1) = '0') then
			vetor2 <= "0000";
		
		elsif (B(1) = '1') then
			vetor2 <= A(2) & A(1) & A(0) & '0';
		
		end if;
		
		if (B(2) = '0') then
			vetor3 <= "0000";
		
		elsif (B(2) = '1') then
			vetor3 <= A(1) & A(0) & "00";
		
		end if;
		
		if (B(3) = '0') then
			vetor4 <= "0000";
		
		elsif (B(3) = '1') then
			vetor4 <= A(0) & "000";
			
		end if;	
			
	end process P1;
			
	primeiraSoma: BLOCO_SOMADOR port map (vetor1, vetor2, '0', soma1, c(0));
	segundaSoma: BLOCO_SOMADOR port map (soma1, vetor3, '0', soma2, c(1));
	terceiraSoma: BLOCO_SOMADOR port map (soma2, vetor4, '0', resultado, c(2));
	
	saidaMult <= resultado;
	Cout <= c(2);
	
end Behavioral;

