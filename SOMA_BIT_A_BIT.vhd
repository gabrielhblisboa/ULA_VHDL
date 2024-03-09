----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:16:43 05/05/2023 
-- Design Name: 
-- Module Name:    SOMA_BIT_A_BIT - Behavioral 
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

entity SOMA_ULA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           soma : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end SOMA_ULA;

architecture Behavioral of SOMA_ULA is

begin

soma <= (A xor B) xor Cin;
Cout <= (A and B) or (Cin and (A xor B)); 

end Behavioral;

