----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:39:35
-- Design Name: 
-- Module Name: password_checker - Behavioral
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

entity password_checker is
    Port (
        password_in : in STD_LOGIC_VECTOR (3 downto 0);
        unlock      : out STD_LOGIC
    );
end password_checker;

architecture Behavioral of password_checker is

constant PASSWORD : STD_LOGIC_VECTOR (3 downto 0) := "1010";

begin

process(password_in)

begin

    if(password_in = PASSWORD) then
        unlock <= '1';
    else
        unlock <= '0';
    end if;

end process;

end Behavioral;
