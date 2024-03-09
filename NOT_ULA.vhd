----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:23 05/05/2023 
-- Design Name: 
-- Module Name:    NOT_ULA - Behavioral 
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

entity NOT_ULA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           E : out  STD_LOGIC_VECTOR (3 downto 0));
end NOT_ULA;

Sarchitecture Behavioral of NOT_ULA is

begin

E <= not A;

end Behavioral;

