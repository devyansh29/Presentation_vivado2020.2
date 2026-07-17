----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:41:19
-- Design Name: 
-- Module Name: comparator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is
    Port (
        countA : in unsigned(7 downto 0);
        countB : in unsigned(7 downto 0);
        countC : in unsigned(7 downto 0);

        winner : out STD_LOGIC_VECTOR(1 downto 0)
    );
end comparator;

architecture Behavioral of comparator is

begin

process(countA, countB, countC)

begin

    if((countA > countB) and (countA > countC)) then

        winner <= "00";

    elsif((countB > countA) and (countB > countC)) then

        winner <= "01";

    elsif((countC > countA) and (countC > countB)) then

        winner <= "10";

    else

        winner <= "11";

    end if;

end process;

end Behavioral;
