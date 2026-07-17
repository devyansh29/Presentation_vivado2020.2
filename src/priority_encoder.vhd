----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:31:02
-- Design Name: 
-- Module Name: priority_encoder - Behavioral
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

entity priority_encoder is
    Port(
        voteA      : in STD_LOGIC;
        voteB      : in STD_LOGIC;
        voteC      : in STD_LOGIC;

        voteA_out  : out STD_LOGIC;
        voteB_out  : out STD_LOGIC;
        voteC_out  : out STD_LOGIC
    );
end priority_encoder;

architecture Behavioral of priority_encoder is
begin

process(voteA, voteB, voteC)

begin

    voteA_out <= '0';
    voteB_out <= '0';
    voteC_out <= '0';

    if(voteA='1') then

        voteA_out <= '1';

    elsif(voteB='1') then

        voteB_out <= '1';

    elsif(voteC='1') then

        voteC_out <= '1';

    end if;

end process;

end Behavioral;


