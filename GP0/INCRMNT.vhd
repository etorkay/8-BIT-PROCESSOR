----------------------------------------------------------------------------------
-----------------------------------4 BIT INCREMENTOR------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--entity
entity INCRMNT is
    port(
        INPUT: IN STD_LOGIC_VECTOR(3 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end INCRMNT;

--architecture
architecture Behavioral of INCRMNT is

begin
	 OUTPUT <= INPUT + 1; --increment

end Behavioral;

