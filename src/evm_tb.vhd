----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:14:47
-- Design Name: 
-- Module Name: evm_tb - Behavioral
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

entity evm_tb is
end evm_tb;

architecture Behavioral of evm_tb is

component evm_top
Port(
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;

    voteA : in STD_LOGIC;
    voteB : in STD_LOGIC;
    voteC : in STD_LOGIC;

    password : in STD_LOGIC_VECTOR(3 downto 0);

    displayA : out unsigned(7 downto 0);
    displayB : out unsigned(7 downto 0);
    displayC : out unsigned(7 downto 0);

    displayWinner : out STD_LOGIC_VECTOR(1 downto 0)
);
end component;

signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal enable : STD_LOGIC := '0';

signal voteA : STD_LOGIC := '0';
signal voteB : STD_LOGIC := '0';
signal voteC : STD_LOGIC := '0';

signal password : STD_LOGIC_VECTOR(3 downto 0) := "0000";

signal displayA : unsigned(7 downto 0);
signal displayB : unsigned(7 downto 0);
signal displayC : unsigned(7 downto 0);

signal displayWinner : STD_LOGIC_VECTOR(1 downto 0);

begin

UUT: evm_top
port map(

clk=>clk,
reset=>reset,
enable=>enable,

voteA=>voteA,
voteB=>voteB,
voteC=>voteC,

password=>password,

displayA=>displayA,
displayB=>displayB,
displayC=>displayC,

displayWinner=>displayWinner

);

clk_process: process
begin

while true loop

clk<='0';
wait for 10 ns;

clk<='1';
wait for 10 ns;

end loop;

end process;

stimulus: process

begin

------------------------
-- Reset
------------------------

reset<='1';
wait for 20 ns;

reset<='0';

------------------------
-- Enable Voting
------------------------

enable<='1';

------------------------
-- Candidate A gets 2 votes
------------------------

voteA<='1';
wait for 20 ns;
voteA<='0';

wait for 20 ns;

voteA<='1';
wait for 20 ns;
voteA<='0';

------------------------
-- Candidate B gets 1 vote
------------------------

wait for 20 ns;

voteB<='1';
wait for 20 ns;
voteB<='0';

------------------------
-- Candidate C gets 3 votes
------------------------

wait for 20 ns;

voteC<='1';
wait for 20 ns;
voteC<='0';

wait for 20 ns;

voteC<='1';
wait for 20 ns;
voteC<='0';

wait for 20 ns;

voteC<='1';
wait for 20 ns;
voteC<='0';

------------------------
-- Enter Password
------------------------

password<="1010";

wait for 100 ns;

wait;

end process;

end Behavioral;
