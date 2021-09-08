library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity WasmFpgaUartInterconnect is
    port (
        Control_Adr : in std_logic_vector(23 downto 0);
        Control_Sel : in std_logic_vector(3 downto 0);
        Control_DatIn : in std_logic_vector(31 downto 0);
        Control_We : in std_logic;
        Control_Stb : in std_logic;
        Control_Cyc : in std_logic_vector(0 downto 0);
        Control_DatOut : out std_logic_vector(31 downto 0);
        Control_Ack : out std_logic;
        Loader_Adr : in std_logic_vector(23 downto 0);
        Loader_Sel : in std_logic_vector(3 downto 0);
        Loader_DatIn : in std_logic_vector(31 downto 0);
        Loader_We : in std_logic;
        Loader_Stb : in std_logic;
        Loader_Cyc : in std_logic_vector(0 downto 0);
        Loader_DatOut : out std_logic_vector(31 downto 0);
        Loader_Ack : out std_logic;
        Engine_Adr : in std_logic_vector(23 downto 0);
        Engine_Sel : in std_logic_vector(3 downto 0);
        Engine_DatIn : in std_logic_vector(31 downto 0);
        Engine_We : in std_logic;
        Engine_Stb : in std_logic;
        Engine_Cyc : in std_logic_vector(0 downto 0);
        Engine_DatOut : out std_logic_vector(31 downto 0);
        Engine_Ack : out std_logic;
        Uart_Adr : out std_logic_vector(23 downto 0);
        Uart_Sel : out std_logic_vector(3 downto 0);
        Uart_DatIn: in std_logic_vector(31 downto 0);
        Uart_We : out std_logic;
        Uart_Stb : out std_logic;
        Uart_Cyc : out std_logic_vector(0 downto 0);
        Uart_DatOut : out std_logic_vector(31 downto 0);
        Uart_Ack : in std_logic
    );
end entity WasmFpgaUartInterconnect;

architecture Behavioural of WasmFpgaUartInterconnect is

begin

  Control_DatOut <= Uart_DatIn;
  Control_Ack <= Uart_Ack;

  Loader_DatOut <= Uart_DatIn;
  Loader_Ack <= Uart_Ack;

  Engine_DatOut <= Uart_DatIn;
  Engine_Ack <= Uart_Ack;

  process (Control_Adr, Control_Sel, Control_DatIn, Control_We, Control_Stb, Control_Cyc,
           Loader_Adr, Loader_Sel, Loader_DatIn, Loader_We, Loader_Stb, Loader_Cyc,
           Engine_Adr, Engine_Sel, Engine_DatIn, Engine_We, Engine_Stb, Engine_Cyc)
  begin
    if Control_Cyc = "1" then
        Uart_Adr <= Control_Adr;
        Uart_Sel <= Control_Sel;
        Uart_DatOut <= Control_DatIn;
        Uart_We <= Control_We;
        Uart_Stb <= Control_Stb;
        Uart_Cyc <= Control_Cyc;
    elsif Loader_Cyc = "1" then
        Uart_Adr <= Loader_Adr;
        Uart_Sel <= Loader_Sel;
        Uart_DatOut <= Loader_DatIn;
        Uart_We <= Loader_We;
        Uart_Stb <= Loader_Stb;
        Uart_Cyc <= Loader_Cyc;
    elsif Engine_Cyc = "1" then
        Uart_Adr <= Engine_Adr;
        Uart_Sel <= Engine_Sel;
        Uart_DatOut <= Engine_DatIn;
        Uart_We <= Engine_We;
        Uart_Stb <= Engine_Stb;
        Uart_Cyc <= Engine_Cyc;
    else
        Uart_Adr <= (others => '0');
        Uart_Sel <= (others => '0');
        Uart_DatOut <= (others => '0');
        Uart_We <= '0';
        Uart_Stb <= '0';
        Uart_Cyc <= (others => '0');
    end if;
  end process;

end;
