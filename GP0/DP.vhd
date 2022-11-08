----------------------------------------------------------------------------------
--------------------------------------DATAPATH------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity DP is
    port(
        L_IR, L_PC, L_A: IN STD_LOGIC;
        IMUX, JMUX: IN STD_LOGIC;
        CLK, RST: IN STD_LOGIC;
        INPUT: IN STD_LOGIC_VECTOR(7 downto 0);

        OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0);
        IR: OUT STD_LOGIC_VECTOR(2 downto 0);
		  ANEQ0: OUT STD_LOGIC
    );
end DP;

--architecture
architecture Structural of DP is
    --internal function
    function ANDXNS(N: NATURAL; B: STD_LOGIC_VECTOR) return STD_LOGIC is --AND N-BITS
		variable result: STD_LOGIC;
		begin
            for i in 0 to N-1 loop
                --result := B(i);
                if (i = 0) then
                    result := B(0);
                else 
                    result := result AND B(i);
                end if ;
            end loop;
        return result;
	end function;

    --internal signals
    signal DECOUT: STD_LOGIC_VECTOR(7 downto 0);
    signal A_Q, IR_Q: STD_LOGIC_VECTOR(7 downto 0);
    signal A_D, IR_D: STD_LOGIC_VECTOR(7 downto 0);
    signal PC_Q, PC_D, INCOUT: STD_LOGIC_VECTOR(3 downto 0);

    --component declaration 
    component REG
		  GENERIC(N: POSITIVE);
        port(
            CLK, CLR, LOAD: IN STD_LOGIC;
            D: IN STD_LOGIC_VECTOR(N-1 downto 0);
            Q: OUT STD_LOGIC_VECTOR(N-1 downto 0)
        );
    end component;


    component MUX
		  GENERIC(N: POSITIVE);
        port(
            INPUT_1, INPUT_0: IN STD_LOGIC_VECTOR(N-1 downto 0);
            SEL: IN STD_LOGIC;
            OUTPUT: OUT STD_LOGIC_VECTOR(N-1 downto 0) 
        );
    end component;


    component DECRMNT
        port(
            INPUT: IN STD_LOGIC_VECTOR(7 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;


    component INCRMNT
        port(
            INPUT: IN STD_LOGIC_VECTOR(3 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;


    component ROM
        port(
            Q: OUT STD_LOGIC_VECTOR(7 downto 0);
            ADDR: IN STD_LOGIC_VECTOR(3 downto 0);
            CLK: IN STD_LOGIC
        );
    end component;



begin
    IR0: REG GENERIC MAP (8) port map(
        CLK => CLK, 
        CLR => RST,
        LOAD => L_IR,
        D => IR_D,
        Q => IR_Q

    );
    PC0: REG GENERIC MAP (4) port map(
        CLK => CLK, 
        CLR => RST,
        LOAD => L_PC,
        D => PC_D,
        Q => PC_Q
    );
     A0: REG GENERIC MAP (8) port map(
        CLK => CLK, 
        CLR => RST,
        LOAD => L_A,
        D => A_D,
        Q => A_Q

     );

    JMUX0: MUX GENERIC MAP (4) port map(
        INPUT_1 => IR_Q(3 downto 0),
        INPUT_0 => INCOUT,
        SEL => JMUX, 
        OUTPUT => PC_D
    );
    IMUX0: MUX GENERIC MAP (8) port map(
        INPUT_1 => INPUT,
        INPUT_0 => DECOUT,
        SEL => IMUX,
        OUTPUT => A_D

    );

    INC0: INCRMNT port map(
        INPUT => PC_Q,
        OUTPUT => INCOUT
    ); 
    DEC0: DECRMNT port map(
        INPUT => A_Q,
        OUTPUT => DECOUT
    );

    ROM0: ROM port map(
        Q => IR_D,
        ADDR => PC_Q,
        CLK => CLK
    );

    IR <= IR_Q(7 downto 5);
	OUTPUT <= A_Q;
    ANEQ0 <= ANDXNS(8, A_Q);

	 
    
    

end Structural;

