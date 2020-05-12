-- VHDL assignment
-- 4 bit binary multiplier!

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplier_4bit is
   port
   (
      num1, num2: in std_logic_vector(3 downto 0);
      ans: out std_logic_vector(7 downto 0)
   );
end entity multiplier_4bit;

architecture Behavioral of multiplier_4bit is
--Experimental code-
function vector_to_int (A : std_logic_vector) return integer is variable answer : integer;
  begin
    answer := 0;
    
    for I in 0 to A'length-1 loop
    if (A(I) = '1') then 
        answer:= answer + (2 ** I);
        report("Int value is " & integer'image(answer));
    else
    next;
      
     end if;  
    end loop;
    report("Int value is " & integer'image(answer));
    return answer;
  end vector_to_int;
  --end of experimental code
  
  --function to convert to int to vector
  function int_to_vector (A : integer) return std_logic_vector is variable answer : std_logic_vector(7 downto 0);
  variable dividend : integer :=A;
  variable remainder : integer :=0;
  begin
  answer:= "00000000";

  for index in 0 to 7 loop
  remainder := dividend mod 2;
  if (remainder = 1) then
  answer(index) := '1';
  else
  answer(index) := '0';
  end if;
  
  dividend:= dividend - remainder;
  dividend := dividend/2;
  
  end loop;
  return answer;
  end int_to_vector;
begin
   
   ans <= std_logic_vector(int_to_vector(vector_to_int(num1) * vector_to_int(num2)));

end architecture Behavioral;
