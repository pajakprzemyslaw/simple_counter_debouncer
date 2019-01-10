----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2018 21:40:36
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
  Port 
  (
        clk: in STD_LOGIC;
        btn_state: in STD_LOGIC;
        res: in STD_LOGIC;
        rst_i : in STD_LOGIC;
        led: out STD_LOGIC_VECTOR(3 downto 0)
  );
end main;



architecture Behavioral of main is

signal btn_state_cln : STD_LOGIC;
signal rst_i_cln : STD_LOGIC;
signal btn_state_input: STD_LOGIC;
signal rst_input: STD_LOGIC;
signal clk_div: STD_LOGIC;

component f_div_1
Port 
(
    clk : in STD_logic;
    res : in STD_LOGIC;
    clk_o : out STD_LOGIC
);
end component f_div_1;

component btn_cleaner is
  Port 
  ( 
     clk_i : in STD_LOGIC; -- 1 khz
     btn_i: in STD_LOGIC;
     res:   in   STD_LOGIC;
     btn_o: out STD_LOGIC
  );
end component btn_cleaner;


component overwrite is
Port 
  (
        btn_i_cln : in STD_LOGIC;
        clk_div   : in STD_LOGIC;
        btn_o     : out STD_LOGIC
    );
end component overwrite;

component temporary_counter is
Port 
( 
    clk_i: in STD_LOGIC;
    btn_state: in STD_LOGIC;
    res: in STD_LOGIC;
    q: out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

begin

f_div_1_0 : f_div_1
Port map
(
    clk => clk,
    res => res,
    clk_o => clk_div
);

btn_cleaner_1 : btn_cleaner
Port map
(
     clk_i => clk_div,
     btn_i => btn_state,
     res   => res,
     btn_o => btn_state_cln
);

btn_cleaner_2 : btn_cleaner
Port map
(
     clk_i => clk_div,
     btn_i => rst_i,
     res   => res,
     btn_o => rst_i_cln
);
overwrite_1 : overwrite
Port map
(
    btn_i_cln => btn_state_cln,
    clk_div   => clk_div,
    btn_o     => btn_state_input
);

overwrite_2 : overwrite
Port map
(
    btn_i_cln => rst_i_cln,
    clk_div   => clk_div,
    btn_o     => rst_input
);

temporary_counter_1 : temporary_counter
Port map
(
    clk_i => clk_div,
    btn_state => btn_state_input,
    res       => rst_input,
    q         => led
);


end Behavioral;
