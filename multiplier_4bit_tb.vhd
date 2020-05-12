library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity multiplier_4bit_tb is
--  Port ( );
end multiplier_4bit_tb;

architecture Behavioral of multiplier_4bit_tb is
component multiplier_4bit
port( 
num1, num2: in std_logic_vector(3 downto 0);
      ans: out std_logic_vector(7 downto 0)
);
end component;

signal num1 : std_logic_vector(3 downto 0);
signal num2 : std_logic_vector(3 downto 0);
signal ans : std_logic_vector(7 downto 0);
begin
utt: multiplier_4bit port map(
num1=>num1,
num2=>num2,
ans=>ans
);
stimulus: process
begin
 
 for v in 1 to 10 loop
 num1<= std_logic_vector(to_unsigned(5,4));
 num2<= std_logic_vector(to_unsigned(v,4));
 wait for 10 ns;
 end loop;
 
 wait;
end process;

end Behavioral;
