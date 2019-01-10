----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2018 22:50:29
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
  Port 
  ( clk_i: in STD_LOGIC;
    btn_i: in STD_LOGIC;
    btn_o: out STD_LOGIC;
    rst:   in  STD_LOGIC
  );
end debouncer;

architecture Behavioral of debouncer is
signal counter: integer:=0;
signal btn_temp: STD_LOGIC:='0';
signal btn_blocker: STD_LOGIC:='0';
--signal btn_o_1: STD_LOGIC;
--signal btn_o_2: STD_LOGIC;
begin
process(clk_i, btn_i, rst)
variable N: integer:=50;

begin
    if(rst='1') then
        btn_blocker <= '0';
        btn_temp <='0';
        counter <=0;
    elsif(rising_edge(clk_i)) then
        if (btn_blocker = '0') then 
            if( btn_i ='1' and btn_temp = '0') then
                btn_temp <= btn_i;
                btn_blocker <= '1';
            end if;
        elsif(btn_blocker ='1') then
            if( counter < N) then
                counter <= counter +1;
            elsif( counter >= N) then
                btn_blocker <='0';
                counter <= 0;
            end if;        
        end if;
    end if;
end process;
btn_o <= btn_temp;
--btn_o_1 <= btn_temp and (not btn_o_2);



end Behavioral;
