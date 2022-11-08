----------------------------------------------------------------------------------
-------------------------------------REGISTER N BIT-------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;





--entity
entity REG is
	 GENERIC(N: POSITIVE);
    port(
        CLK, CLR, LOAD: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR(N-1 downto 0);
        Q: OUT STD_LOGIC_VECTOR(N-1 downto 0)
    );
end REG;


--architecture
architecture Behavioral of REG is
    --internal signal
    signal tmp: STD_LOGIC_VECTOR(N-1 downto 0);
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
    identifier : process(CLK,tmp)
    begin
        if (RISING_EDGE(CLK)) then

            if (CLR = '1') then
                tmp <= repeat(N, '0');
            elsif(LOAD = '1') then
                tmp <= D;
            else
                tmp <= tmp;
            end if ;
            
        end if ;
        Q <= tmp;
        
    end process ; -- identifier


end Behavioral;




