Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Nios_Top IS
PORT(
		CLK_50: IN STD_LOGIC_VECTOR(1 downto 0);
		CLK_25: IN STD_LOGIC;
		BUTTON: IN STD_LOGIC_VECTOR(2 downto 0);
		SW: IN STD_LOGIC_VECTOR(9 downto 0);
		LED_GREEN: OUT STD_LOGIC_VECTOR(9 downto 0);
		SEVENSEG0,SEVENSEG1,SEVENSEG2,SEVENSEG3: OUT STD_LOGIC_VECTOR(7 downto 0);
		sdram_addr: OUT STD_LOGIC_VECTOR(12 downto 0);
		sdram_dq: inout STD_LOGIC_VECTOR(15 downto 0);
		sdram_ba: OUT STD_LOGIC_VECTOR(1 downto 0);
		sdram_ldqm,sdram_udqm: out STD_LOGIC;
		sdram_ras_n,sdram_cas_n,sdram_we_n,sdram_cs_n: OUT STD_LOGIC;
		sdram_clk,sdram_cke: OUT STD_LOGIC);
END ENTITY Nios_Top;

ARCHITECTURE mapping OF Nios_Top IS
    component Nios2 is
        port (
            clk_clk                           : in    std_logic                     := 'X';             -- clk
            reset_reset_n                     : in    std_logic                     := 'X';             -- reset_n
            pio_0_external_connection_export  : out   std_logic_vector(9 downto 0);                     -- export
            pio_2_external_connection_export  : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- export
            pio_1_external_connection_export  : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- export
            new_sdram_controller_0_wire_addr  : out   std_logic_vector(12 downto 0);                    -- addr
            new_sdram_controller_0_wire_ba    : out   std_logic_vector(1 downto 0);                     -- ba
            new_sdram_controller_0_wire_cas_n : out   std_logic;                                        -- cas_n
            new_sdram_controller_0_wire_cke   : out   std_logic;                                        -- cke
            new_sdram_controller_0_wire_cs_n  : out   std_logic;                                        -- cs_n
            new_sdram_controller_0_wire_dq    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
            new_sdram_controller_0_wire_dqm   : out   std_logic_vector(1 downto 0);                     -- dqm
            new_sdram_controller_0_wire_ras_n : out   std_logic;                                        -- ras_n
            new_sdram_controller_0_wire_we_n  : out   std_logic;                                        -- we_n
            sdclk_clk                         : out   std_logic 
				);
    end component Nios2;
	 
	 Component seven_seg_hex_nibble IS
		PORT(	in_vect: IN STD_LOGIC_VECTOR(3 downto 0);
		out_vect: OUT STD_LOGIC_VECTOR(6 downto 0));
	END component seven_seg_hex_nibble;
signal dqm : STD_LOGIC_VECTOR(1 downto 0);
Begin
sdram_udqm <= dqm(1);
sdram_ldqm <= dqm(0);
    u0 : component Nios2
        port map (
            clk_clk                          => CLK_50(0),                          --                       clk.clk
            reset_reset_n                    => BUTTON(0),                    --                     reset.reset_n
            pio_0_external_connection_export => LED_GREEN, -- pio_0_external_connection.export
            pio_2_external_connection_export => BUTTON, -- pio_2_external_connection.export
            pio_1_external_connection_export => SW,  -- pio_1_external_connection.export
				new_sdram_controller_0_wire_addr  => sdram_addr,  -- new_sdram_controller_0_wire.addr
            new_sdram_controller_0_wire_ba    => sdram_ba,    --                            .ba
            new_sdram_controller_0_wire_cas_n => sdram_cas_n, --                            .cas_n
            new_sdram_controller_0_wire_cke   => sdram_cke,   --                            .cke
            new_sdram_controller_0_wire_cs_n  => sdram_cs_n,  --                            .cs_n
            new_sdram_controller_0_wire_dq    => sdram_dq,    --                            .dq
            new_sdram_controller_0_wire_dqm   => dqm,   --                            .dqm
            new_sdram_controller_0_wire_ras_n => sdram_ras_n, --                            .ras_n
            new_sdram_controller_0_wire_we_n  => sdram_we_n,  --                            .we_n
            sdclk_clk                         => sdram_clk                          --                       sdclk.clk
        );
	u1: seven_seg_hex_nibble PORT MAP(SW(3 downto 0),SEVENSEG0(6 downto 0));
	u2: seven_seg_hex_nibble PORT MAP(SW(7 downto 4),SEVENSEG1(6 downto 0));
	u3: seven_seg_hex_nibble PORT MAP(SW(5 downto 2),SEVENSEG2(6 downto 0));
	u4: seven_seg_hex_nibble PORT MAP(SW(9 downto 6),SEVENSEG3(6 downto 0));
END ARCHITECTURE mapping;