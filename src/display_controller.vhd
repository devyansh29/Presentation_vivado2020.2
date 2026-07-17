----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:44:09
-- Design Name: 
-- Module Name: display_controller - Behavioral
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

entity display_controller is
    Port (
        unlock  : in STD_LOGIC;
        countA  : in unsigned(7 downto 0);
        countB  : in unsigned(7 downto 0);
        countC  : in unsigned(7 downto 0);
        winner  : in STD_LOGIC_VECTOR(1 downto 0);

        displayA : out unsigned(7 downto 0);
        displayB : out unsigned(7 downto 0);
        displayC : out unsigned(7 downto 0);
        displayWinner : out STD_LOGIC_VECTOR(1 downto 0)
    );
end display_controller;

architecture Behavioral of display_controller is

begin

process(unlock, countA, countB, countC, winner)

begin

    if(unlock='1') then

        displayA <= countA;
        displayB <= countB;
        displayC <= countC;
        displayWinner <= winner;

    else

        displayA <= (others => '0');
        displayB <= (others => '0');
        displayC <= (others => '0');
        displayWinner <= "00";

    end if;

end process;

end Behavioral;
