-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xfMat2AXIvideo is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    img_rows_read : IN STD_LOGIC_VECTOR (31 downto 0);
    img_cols_read : IN STD_LOGIC_VECTOR (31 downto 0);
    img_data_V_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    img_data_V_ce0 : OUT STD_LOGIC;
    img_data_V_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    p_dst_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_TVALID : OUT STD_LOGIC;
    p_dst_TREADY : IN STD_LOGIC;
    p_dst_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
    p_dst_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    p_dst_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    p_dst_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    p_dst_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    p_dst_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of xfMat2AXIvideo is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal p_dst_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln187_reg_303 : STD_LOGIC_VECTOR (0 downto 0);
    signal index_assign_reg_148 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_0_reg_158 : STD_LOGIC_VECTOR (30 downto 0);
    signal smax_cast_fu_187_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal smax_cast_reg_279 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln197_fu_191_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln197_reg_284 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln186_fu_206_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal i_fu_211_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal i_reg_293 : STD_LOGIC_VECTOR (30 downto 0);
    signal index_fu_217_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal index_reg_298 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln187_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state4_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal j_fu_231_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal axi_last_V_fu_237_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_last_V_reg_312 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln203_fu_247_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal index_0_reg_125 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal i_0_reg_137 : STD_LOGIC_VECTOR (30 downto 0);
    signal sext_ln621_fu_242_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_user_V_fu_66 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal empty_fu_169_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_5_fu_175_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal smax_fu_179_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal zext_ln186_fu_202_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln187_fu_222_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((icmp_ln186_fu_206_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((icmp_ln186_fu_206_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_0_reg_137_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                i_0_reg_137 <= i_reg_293;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_0_reg_137 <= ap_const_lv31_0;
            end if; 
        end if;
    end process;

    index_0_reg_125_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                index_0_reg_125 <= index_reg_298;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                index_0_reg_125 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    index_assign_reg_148_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln187_fu_226_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                index_assign_reg_148 <= add_ln203_fu_247_p2;
            elsif (((icmp_ln186_fu_206_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                index_assign_reg_148 <= index_0_reg_125;
            end if; 
        end if;
    end process;

    j_0_reg_158_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln187_fu_226_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                j_0_reg_158 <= j_fu_231_p2;
            elsif (((icmp_ln186_fu_206_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                j_0_reg_158 <= ap_const_lv31_0;
            end if; 
        end if;
    end process;

    tmp_user_V_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln187_reg_303 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                tmp_user_V_fu_66 <= ap_const_lv1_0;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                tmp_user_V_fu_66 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                add_ln197_reg_284 <= add_ln197_fu_191_p2;
                    smax_cast_reg_279(30 downto 0) <= smax_cast_fu_187_p1(30 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln187_fu_226_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                axi_last_V_reg_312 <= axi_last_V_fu_237_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_reg_293 <= i_fu_211_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln187_reg_303 <= icmp_ln187_fu_226_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln186_fu_206_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                index_reg_298 <= index_fu_217_p2;
            end if;
        end if;
    end process;
    smax_cast_reg_279(31) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln186_fu_206_p2, ap_CS_fsm_state2, icmp_ln187_fu_226_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln186_fu_206_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((icmp_ln187_fu_226_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((icmp_ln187_fu_226_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln197_fu_191_p2 <= std_logic_vector(signed(ap_const_lv32_FFFFFFFF) + signed(img_cols_read));
    add_ln203_fu_247_p2 <= std_logic_vector(signed(index_assign_reg_148) + signed(ap_const_lv32_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state4_io)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state4_io));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state4_io)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state4_io));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_io_assign_proc : process(p_dst_TREADY, icmp_ln187_reg_303)
    begin
                ap_block_state4_io <= ((icmp_ln187_reg_303 = ap_const_lv1_1) and (p_dst_TREADY = ap_const_logic_0));
    end process;

        ap_block_state4_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln187_fu_226_p2)
    begin
        if ((icmp_ln187_fu_226_p2 = ap_const_lv1_0)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, icmp_ln186_fu_206_p2, ap_CS_fsm_state2)
    begin
        if ((((icmp_ln186_fu_206_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(icmp_ln186_fu_206_p2, ap_CS_fsm_state2)
    begin
        if (((icmp_ln186_fu_206_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    axi_last_V_fu_237_p2 <= "1" when (zext_ln187_fu_222_p1 = add_ln197_reg_284) else "0";
    empty_5_fu_175_p1 <= img_cols_read(31 - 1 downto 0);
    empty_fu_169_p2 <= "1" when (signed(img_cols_read) > signed(ap_const_lv32_0)) else "0";
    i_fu_211_p2 <= std_logic_vector(unsigned(i_0_reg_137) + unsigned(ap_const_lv31_1));
    icmp_ln186_fu_206_p2 <= "1" when (signed(zext_ln186_fu_202_p1) < signed(img_rows_read)) else "0";
    icmp_ln187_fu_226_p2 <= "1" when (signed(zext_ln187_fu_222_p1) < signed(img_cols_read)) else "0";
    img_data_V_address0 <= sext_ln621_fu_242_p1(12 - 1 downto 0);

    img_data_V_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
            img_data_V_ce0 <= ap_const_logic_1;
        else 
            img_data_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    index_fu_217_p2 <= std_logic_vector(unsigned(smax_cast_reg_279) + unsigned(index_0_reg_125));
    j_fu_231_p2 <= std_logic_vector(unsigned(j_0_reg_158) + unsigned(ap_const_lv31_1));
    p_dst_TDATA <= img_data_V_q0;

    p_dst_TDATA_blk_n_assign_proc : process(p_dst_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln187_reg_303)
    begin
        if (((icmp_ln187_reg_303 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            p_dst_TDATA_blk_n <= p_dst_TREADY;
        else 
            p_dst_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_TDEST <= ap_const_lv1_0;
    p_dst_TID <= ap_const_lv1_0;
    p_dst_TKEEP <= ap_const_lv1_1;
    p_dst_TLAST <= axi_last_V_reg_312;
    p_dst_TSTRB <= ap_const_lv1_0;
    p_dst_TUSER <= tmp_user_V_fu_66;

    p_dst_TVALID_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln187_reg_303, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln187_reg_303 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            p_dst_TVALID <= ap_const_logic_1;
        else 
            p_dst_TVALID <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln621_fu_242_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(index_assign_reg_148),64));

    smax_cast_fu_187_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(smax_fu_179_p3),32));
    smax_fu_179_p3 <= 
        empty_5_fu_175_p1 when (empty_fu_169_p2(0) = '1') else 
        ap_const_lv31_0;
    zext_ln186_fu_202_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_0_reg_137),32));
    zext_ln187_fu_222_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_0_reg_158),32));
end behav;
