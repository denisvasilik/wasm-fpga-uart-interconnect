library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package tb_Types is

    type T_WasmFpgaUartInterconnect_FileIo is
    record
        Loader_DatOut : std_logic_vector(31 downto 0);
        Loader_Ack : std_logic;
        DatOut : std_logic_vector(31 downto 0);
        Ack : std_logic;
        Memory_Adr : std_logic_vector(23 downto 0);
        Memory_Sel : std_logic_vector(3 downto 0);
        Memory_We : std_logic;
        Memory_Stb : std_logic;
        Memory_Cyc : std_logic_vector(0 downto 0);
        Memory_DatOut : std_logic_vector(31 downto 0);
    end record;

    type T_FileIo_WasmFpgaUartInterconnect is
    record
        Loaded : std_logic;
        Loader_Adr : std_logic_vector(23 downto 0);
        Loader_Sel : std_logic_vector(3 downto 0);
        Loader_DatIn : std_logic_vector(31 downto 0);
        Loader_We : std_logic;
        Loader_Stb : std_logic;
        Loader_Cyc : std_logic_vector(0 downto 0);
        Adr : std_logic_vector(23 downto 0);
        Sel : std_logic_vector(3 downto 0);
        DatIn : std_logic_vector(31 downto 0);
        We : std_logic;
        Stb : std_logic;
        Cyc : std_logic_vector(0 downto 0);
        Memory_DatIn: std_logic_vector(31 downto 0);
        Memory_Ack : std_logic;
    end record;

end package;

package body tb_Types is

end package body;
