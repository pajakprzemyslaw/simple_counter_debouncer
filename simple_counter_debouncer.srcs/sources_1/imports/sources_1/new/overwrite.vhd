----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2018 15:11:45
-- Design Name: 
-- Module Name: overwrite - Behavioral
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

entity overwrite is
Port 
  (
        btn_i_cln : in STD_LOGIC;
        clk_div   : in STD_LOGIC;
        btn_o     : out STD_LOGIC
    );
end overwrite;

architecture Behavioral of overwrite is
signal btn_i_cln_r : STD_LOGIC;
signal btn_o_r: STD_LOGIC;

begin

trzymanie_stanu : process(clk_div) is
begin
    if rising_edge(clk_div) then
        btn_i_cln_r <= btn_i_cln;
        if(btn_i_cln ='1' and btn_i_cln_r='0') then
            btn_o_r <= not btn_o_r;
        end if;
    end if;
end process trzymanie_stanu;

btn_o <= btn_o_r;


end Behavioral;
