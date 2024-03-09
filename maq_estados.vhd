----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:58 04/28/2023 
-- Design Name: 
-- Module Name:    maq_estados - Behavioral 
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

entity maq_estados is
    Port ( clk_50MHz: in STD_LOGIC;
			  vetor : in  STD_LOGIC_VECTOR (3 downto 0);
			  botaoA: in STD_LOGIC;
			  botaoB: in STD_LOGIC;
			  botaoS: in STD_LOGIC;
			  reset: in STD_LOGIC;
			  Cin: in STD_LOGIC;
			  led_A: out STD_LOGIC;
			  led_B: out STD_LOGIC;
			  led_S: out STD_LOGIC;
			  display_leds : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout: out STD_LOGIC);
end maq_estados;


architecture Behavioral of maq_estados is

component MUX is
  
	 Port ( selecao : in  STD_LOGIC_VECTOR (2 downto 0);
			  A : in  STD_LOGIC_VECTOR (3 downto 0);
			  B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin: in STD_LOGIC;
			  saida : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout: out STD_LOGIC);

end component;

component divisor_freq is
	Port(
		clk_50MHz: in STD_LOGIC;
		clk_out: out STD_LOGIC
		 );
		 
end component;


type estado is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12,
					 E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23);
signal estadoAtual, estadoAux: estado := E0;
signal clk_2seg: STD_LOGIC;
signal A, B, resultado, selecao: STD_LOGIC_VECTOR (3 downto 0);
signal Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7: STD_LOGIC_VECTOR (3 downto 0);
signal c: STD_LOGIC_VECTOR (6 downto 0);

begin

	dividir_clock: divisor_freq port map (clk_50MHz, clk_2seg);
	
	AND_ULA: MUX port map ("000", A, B, Cin, Z0, c(0));
	OR_ULA: MUX port map ("001", A, B, Cin, Z1, c(1));
	NOT_ULA: MUX port map ("010", A, B, Cin, Z2, c(2));
	XOR_ULA: MUX port map ("011", A, B, Cin, Z3, c(3));
	SOMA_ULA: MUX port map ("100", A, B, Cin, Z4, c(4));
	SUB_ULA: MUX port map ("101", A, B, Cin, Z5, c(5));
	MULT_ULA: MUX port map ("110", A, B, Cin, Z6, c(6));
	
	
	process (clk_2seg, estadoAux)
	begin
		if (rising_edge(clk_2seg)) then
			estadoAtual <= estadoAux;
		end if;
	end process;
	
	process (vetor, botaoA, botaoB, botaoS, reset, estadoAtual, estadoAux, c,
				A, B, selecao, Z0, Z1, Z2, Z3, Z4, Z5, Z6)
	
	begin
		
		if (reset = '1') then
			estadoAux <= E0;
			display_leds <= "0000";
			
		else
			case estadoAtual is
				when E0 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					if (botaoA = '1') then
						A <= vetor;
						estadoAux <= E1;
					else
						estadoAux <= E0;
					end if;
				
				when E1 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					if (botaoB = '1') then
						B <= vetor;
						estadoAux <= E2;
					else
						estadoAux <= E1;
					end if;
					
				when E2 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					if (botaoS = '1') then
						selecao <= vetor;
						estadoAux <= E3;
						if (selecao = "0000") then
							estadoAux <= E3;
						elsif (selecao = "0001") then
							estadoAux <= E6;
						elsif (selecao = "0010") then
							estadoAux <= E9;
						elsif (selecao = "0011") then
							estadoAux <= E12;
						elsif (selecao = "0100") then
							estadoAux <= E15;
						elsif (selecao = "0101") then
							estadoAux <= E18;
						elsif (selecao = "0110") then
							estadoAux <= E21;
						end if;
					else
						estadoAux <= E2;
					end if;
					
				when E3 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E4;
				
				when E4 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E5;
					
				when E5 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z0;
					Cout <= c(0);
					estadoAux <= E6;
					
				when E6 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E7;

				when E7 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E8;

					
				when E8 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z1;
					Cout <= c(1);
					estadoAux <= E9;

					
				when E9 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E10;

				
				when E10 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E11;

					
				when E11 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z2;
					Cout <= c(2);
					estadoAux <= E12;

					
				when E12 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E13;

				
				when E13 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E14;

					
				when E14 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z3;
					Cout <= c(3);
					estadoAux <= E15;

					
				when E15 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E16;

				
				when E16 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E17;

					
				when E17 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z4;
					Cout <= c(4);
					estadoAux <= E18;

					
				when E18 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E19;

				
				when E19 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E20;

					
				when E20 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z5;
					Cout <= c(5);
					estadoAux <= E21;

					
				when E21 =>
					led_A <= '1';
					led_B <= '0';
					led_S <= '0';
					display_leds <= A;
					estadoAux <= E22;

				
				when E22 =>
					led_A <= '0';
					led_B <= '1';
					led_S <= '0';
					display_leds <= B;
					estadoAux <= E23;

					
				when E23 =>
					led_A <= '0';
					led_B <= '0';
					led_S <= '1';
					display_leds <= Z6;
					Cout <= c(6);
					estadoAux <= E3;

					
				when others =>
					null;
				
			end case;
		end if;
	end process;
	
	
end Behavioral;

