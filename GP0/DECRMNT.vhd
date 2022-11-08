----------------------------------------------------------------------------------
--------------------------------8 BIT DECREMENTOR---------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


--entity
entity DECRMNT is
    port(
        INPUT: IN STD_LOGIC_VECTOR(7 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end DECRMNT;


--architecture
architecture Behavioral of DECRMNT is

begin
    OUTPUT <= STD_LOGIC_VECTOR(UNSIGNED(INPUT) - 1);

end Behavioral;

