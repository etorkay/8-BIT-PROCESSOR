----------------------------------------------------------------------------------
-----------------------------------2 BY 1-----------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity MUX is
	GENERIC (N: POSITIVE);
    port(
        INPUT_1, INPUT_0: IN STD_LOGIC_VECTOR(N-1 downto 0);
        SEL: IN STD_LOGIC;
        OUTPUT: OUT STD_LOGIC_VECTOR(N-1 downto 0) 
    );
end MUX;

--architecture
architecture Behavioral of MUX is
    --internal function
	function repeat(N: natural; B: STD_LOGIC) return STD_LOGIC_VECTOR is
		variable result: STD_LOGIC_VECTOR(1 to N);
		begin
            for i in 1 to N loop
                result(i) := B;
            end loop;
        return result;
	end function;

begin
    with SEL select OUTPUT <= INPUT_0 when '0',
                              INPUT_1 when '1',
							  repeat(N, 'Z') when others;



end Behavioral;

