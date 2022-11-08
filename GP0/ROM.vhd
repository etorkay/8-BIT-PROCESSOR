----------------------------------------------------------------------------------
-----------------------------------16 x 8 BIT ROM---------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



--entity
entity ROM is
    port(
        Q: OUT STD_LOGIC_VECTOR(7 downto 0);
        ADDR: IN STD_LOGIC_VECTOR(3 downto 0);
        CLK: IN STD_LOGIC
    );
end ROM;


--architecture
architecture Structural of ROM is
    type ROM_TYPE is array(0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    constant ROM_CONST: 
        ROM_TYPE:=("00000001", "00001100","00000000", "00000000", 
                    "00000000","00100000", "00000000", "00000000",
                    "00000000", "00000000", "00000000","00000000", 
                    "00000000", "00000000","00000000", "00000000");
begin

    rom_proc : process(CLK)
    begin
        if (RISING_EDGE(CLK)) then
            Q <= ROM_CONST(conv_integer(ADDR));
        end if ;
    end process ; -- rom_proc
    
end Structural;



-- ROM0: lpm_ram_dq GENERIC MAP (
--         lpm_widthad => 4,
--         lpm_outdata => "UNREGISTERED",
--         --
--         lpm_indata => "UNREGISTERED",
--         --
--         lpm_address_control => "UNREGISTERED",
--         lpm_file => "program.mif",-- fill ram with content of file program.mif
--         lpm_width => 8
--     ) PORT MAP (
--         data => "UNREGISTERED",
--         address => ADDR,
--         we => 0,
--         inclock => CLK,
--         q => Q
--     );