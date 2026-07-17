----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:27:15
-- Design Name: 
-- Module Name: vote_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity vote_counter is
    Port(
        clk      : in STD_LOGIC;
        reset    : in STD_LOGIC;
        enable   : in STD_LOGIC;
        voteA    : in STD_LOGIC;
        voteB    : in STD_LOGIC;
        voteC    : in STD_LOGIC;

        countA   : out unsigned(7 downto 0);
        countB   : out unsigned(7 downto 0);
        countC   : out unsigned(7 downto 0)
    );
end vote_counter;

architecture Behavioral of vote_counter is

signal A : unsigned(7 downto 0):=(others=>'0');
signal B : unsigned(7 downto 0):=(others=>'0');
signal C : unsigned(7 downto 0):=(others=>'0');

begin

process(clk,reset)

begin

if(reset='1') then

A<=(others=>'0');
B<=(others=>'0');
C<=(others=>'0');

elsif rising_edge(clk) then

if(enable='1') then

if(voteA='1') then
A<=A+1;

elsif(voteB='1') then
B<=B+1;

elsif(voteC='1') then
C<=C+1;

end if;

end if;

end if;

end process;

countA<=A;
countB<=B;
countC<=C;

end Behavioral;