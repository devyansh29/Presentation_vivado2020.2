----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 14:46:21
-- Design Name: 
-- Module Name: evm_top - Behavioral
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

entity evm_top is
    Port(
        clk        : in STD_LOGIC;
        reset      : in STD_LOGIC;
        enable     : in STD_LOGIC;

        voteA      : in STD_LOGIC;
        voteB      : in STD_LOGIC;
        voteC      : in STD_LOGIC;

        password   : in STD_LOGIC_VECTOR(3 downto 0);

        displayA   : out unsigned(7 downto 0);
        displayB   : out unsigned(7 downto 0);
        displayC   : out unsigned(7 downto 0);

        displayWinner : out STD_LOGIC_VECTOR(1 downto 0)
    );
end evm_top;

architecture Structural of evm_top is

signal voteA_p,voteB_p,voteC_p : STD_LOGIC;

signal countA_sig,countB_sig,countC_sig : unsigned(7 downto 0);

signal unlock_sig : STD_LOGIC;

signal winner_sig : STD_LOGIC_VECTOR(1 downto 0);

begin

----------------------------------------
-- Vote Counter
----------------------------------------

VC: entity work.vote_counter
port map(

    clk => clk,
    reset => reset,
    enable => enable,

    voteA => voteA_p,
    voteB => voteB_p,
    voteC => voteC_p,

    countA => countA_sig,
    countB => countB_sig,
    countC => countC_sig
);

----------------------------------------
-- Priority Encoder
----------------------------------------

PE: entity work.priority_encoder
port map(
    voteA => voteA,
    voteB => voteB,
    voteC => voteC,

    voteA_out => voteA_p,
    voteB_out => voteB_p,
    voteC_out => voteC_p
);

----------------------------------------
-- Password Checker
----------------------------------------

PC: entity work.password_checker
port map(

    password_in => password,

    unlock => unlock_sig

);

----------------------------------------
-- Winner Comparator
----------------------------------------

CMP: entity work.comparator
port map(

    countA => countA_sig,
    countB => countB_sig,
    countC => countC_sig,

    winner => winner_sig

);

----------------------------------------
-- Display Controller
----------------------------------------

DISP: entity work.display_controller
port map(

    unlock => unlock_sig,

    countA => countA_sig,
    countB => countB_sig,
    countC => countC_sig,

    winner => winner_sig,

    displayA => displayA,
    displayB => displayB,
    displayC => displayC,

    displayWinner => displayWinner

);

end Structural;
