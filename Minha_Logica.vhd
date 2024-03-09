----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:34 05/05/2023 
-- Design Name: 
-- Module Name:    Minha_Logica - Behavioral 
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

entity Minha_Logica is
    
	 Port ( selecao : in  STD_LOGIC_VECTOR (2 downto 0);
			  A : in  STD_LOGIC_VECTOR (3 downto 0);	
			  B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin: in STD_LOGIC;
			  saida : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout: out STD_LOGIC);

end Minha_Logica;


architecture Behavioral of Minha_Logica is

component AND_ULA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component OR_ULA is
	 Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component NOT_ULA is
	 Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           E : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component XOR_ULA is
	 Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           F : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component BLOCO_SOMADOR is
	 Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

component SUBTRATOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado : out  STD_LOGIC_VECTOR (3 downto 0);
           overflow : out  STD_LOGIC);
end component;

component MULTIPLICADOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           saidaMult : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC);
end component;


	signal d1, d2, d3, d4, d5, d7, d9: STD_LOGIC_VECTOR (3 downto 0);
	signal d6, d8, d10: STD_LOGIC;

begin
	
	resposta1: AND_ULA port map (A, B, d1);

	resposta2: OR_ULA port map (A, B, d2);
	
	resposta3: NOT_ULA port map (A, d3);
	
	resposta4: XOR_ULA port map (A, B, d4);
	
	resposta5: BLOCO_SOMADOR port map (A, B, Cin, d5, d6);
	
	resposta6: SUBTRATOR port map (A, B, d7, d8);
	
	resposta7: MULTIPLICADOR port map (A, B, d9, d10);

	
	P1: process (selecao, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10)
	
	begin
		

		if (selecao = "000") then
			saida <= d1;
		
		elsif (selecao = "001") then
			saida <= d2;
			
		elsif (selecao = "010") then
			saida <= d3;
	
		elsif (selecao = "011") then
			saida <= d4;
			
		elsif (selecao = "100") then
			saida <= d5;
			Cout <= d6;
			
		elsif (selecao = "101") then
			saida <= d7;
			Cout <= d8;
			
		elsif (selecao = "110") then
			saida <= d9;
			Cout <= d10;
	
		end if;
	
	end process P1;
	
end Behavioral;

