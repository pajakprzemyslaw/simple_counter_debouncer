----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.09.2018 21:10:16
-- Design Name: 
-- Module Name: debug_filter - Behavioral
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

entity debug_filter is
  Port 
  ( 
        btn: in STD_LOGIC;
        res  : in STD_LOGIC;
        clk_i: in STD_logic;
        btn_o: out STD_LOGIC_VECTOR(3 downto 0)
   );
end debug_filter;

architecture Behavioral of debug_filter is

--signal btn_state_reg: STD_LOGIC:='0';
--signal led_reg: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal btn_r : STD_LOGIC;
signal btn_o_r: STD_LOGIC;
begin




trzymanie_stanu : process(clk_i) is
begin
    if rising_edge(clk_i) then
    btn_r <= btn;
    if(btn_r ='1' and btn='0') then
    btn_o_r <= not btn_o_r;
    end if;
    end if;
end process trzymanie_stanu;


btn_o(0) <= btn_o_r;
btn_o(1) <= btn_o_r;
btn_o(2) <= btn_o_r;
btn_o(3) <= btn_o_r;




end Behavioral;
