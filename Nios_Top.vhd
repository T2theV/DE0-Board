Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Nios_Top IS
PORT(
		CLK_50: IN STD_LOGIC_VECTOR(1 downto 0);
		CLK_25: IN STD_LOGIC;
		BUTTON: IN STD_LOGIC_VECTOR(2 downto 0);
		SW: IN STD_LOGIC_VECTOR(9 downto 0);
		LED_GREEN: OUT STD_LOGIC_VECTOR(9 downto 0));
END ENTITY Nios_Top;

ARCHITECTURE mapping OF Nios_Top IS
component Nios2 is
        port (
            clk_clk                          : in  std_logic                    := 'X';             -- clk
            reset_reset_n                    : in  std_logic                    := 'X';             -- reset_n
            pio_0_external_connection_export : out std_logic_vector(9 downto 0);                    -- export
            pio_2_external_connection_export : in  std_logic_vector(2 downto 0) := (others => 'X'); -- export
            pio_1_external_connection_export : in  std_logic_vector(9 downto 0) := (others => 'X')  -- export
        );
    end component Nios2;

Begin

    u0 : component Nios2
        port map (
            clk_clk                          => CLK_50(0),                          --                       clk.clk
            reset_reset_n                    => BUTTON(0),                    --                     reset.reset_n
            pio_0_external_connection_export => LED_GREEN, -- pio_0_external_connection.export
            pio_2_external_connection_export => BUTTON, -- pio_2_external_connection.export
            pio_1_external_connection_export => SW  -- pio_1_external_connection.export
        );

END ARCHITECTURE mapping;
		