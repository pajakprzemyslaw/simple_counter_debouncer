----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2018 23:44:40
-- Design Name: 
-- Module Name: temporary_counter - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity temporary_counter is
  Port 
  ( 
    clk_i: in STD_LOGIC;
    btn_state: in STD_LOGIC;
    res: in STD_LOGIC;
    q: out STD_LOGIC_VECTOR(3 downto 0)
   );
end temporary_counter;
--maszyna stanow i jej stany
--_________________________________________________
architecture Behavioral of temporary_counter is
TYPE counter_states is(START, STOP, RESET);
signal counter_state: counter_states;
--_________________________________________________
--btn wejsciowy
--_________________________________________________
--signal btn_state_reg: STD_LOGIC;
--signal btn_1: STD_LOGIC;
--_________________________________________________

--liczenie
--____________________________________________

--_____________________________________________

--liczniki
--signal licznik_break: integer:= 15;
--constant N_0: integer:=250;
--constant N_1: integer:=500;
--constant N_2: integer:=1000;
--constant N_3: integer:=2000;
--signal licznik_0: Integer;--4 hz
--signal licznik_1: Integer;--2 hz
--signal licznik_2: Integer;--1 hz
--signal licznik_3: Integer;--0,5 hz
--signal tick_0, tick_1, tick_2, tick_3: STD_LOGIC;
signal led_temp: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal btn_state_reg: STD_LOGIC;
signal btn_1:STD_LOGIC;
signal one_tick: STD_LOGIC;
constant N: integer:= 1000;
signal licznik: integer;

begin

btn_1 <= btn_state and (not btn_state_reg);

licznik_1khz: process(clk_i, res) is
begin
    if(res='1') then
        one_tick <= '0';
    elsif(rising_edge(clk_i)) then
        if(licznik < N-1) then
            licznik <= licznik +1;
            one_tick <='0';
        else
            licznik <= 0;
            one_tick <='1';
        end if;
    end if;
end process;

licznik_counter:process (clk_i,res, btn_state )
    begin
        if( res = '1' or btn_1='0') then
            led_temp <="0000";
        elsif (rising_edge(clk_i)) then
        btn_state_reg <= btn_state;
            if(one_tick ='1') then
               led_temp <= led_temp+1;
            end if;
            if(led_temp = "1111") then
                led_temp <= "0000";
            end if;
        end if;
    end process;
    
q<= led_temp(3 downto 0);

--btn_1 <= btn_state and (not btn_state_reg);

--definicja_stanow :process(clk_i, res, btn_state)
--begin
--    if(res ='1') then
--        counter_state <= RESET;
--    elsif(rising_edge(clk_i)) then
--        case counter_state is
--            when RESET =>
--                if(btn_state ='1') then
--                    counter_state <= START;
--                end if;
--            when START =>
--                 if(btn_state ='1') then
--                    counter_state <= STOP;
--                end if;
--            when STOP =>
--                 if(btn_state ='1') then
--                    counter_state <= RESET;
--                 end if;
--            when OTHERS =>
--                counter_state <= RESET;
--        end case;
--    end if;
--end process;
              
--zliczanie: process(clk_i, counter_state)
--begin
--    if(res = '1') then
--        licznik_0 <= 0;
--        licznik_1 <= 0;
--        licznik_2 <= 0;
--        licznik_3 <= 0;
--        tick_0 <= '0';
--        tick_1 <= '0';
--        tick_2 <= '0';
--        tick_3 <= '0';
--    elsif(rising_edge(clk_i)) then
--        if(counter_state = START) then
--            if(licznik_0 < N_0 -1) then
--                licznik_0 <= licznik_0 +1;
--                tick_0 <= '0';
--            else
--                licznik_0 <= 0;
--                tick_0 <= '1';
--            end if;
--            if(licznik_1 < N_1 -1) then
--                licznik_1 <= licznik_1 +1;
--                tick_1 <= '0';
--            else
--                licznik_1 <= 0;
--                tick_1 <= '1';
--            end if;
--            if(licznik_2 < N_2 -1) then
--                tick_2 <= '0';
--                licznik_2 <= licznik_2 +1;
--            else
--                tick_2 <= '1';
--                licznik_2 <= 0;
--            end if;
--            if(licznik_3 < N_2 -1) then
--                tick_3 <= '0';
--                licznik_3 <= licznik_3 +1;
--            else
--                licznik_3 <= 0;
--                tick_3 <= '1';
--            end if;
--        end if;
--      end if;
--end process;    

--proces_time_counter: process(clk_i,res, led_temp) is
--	begin 
--		if res = '1' then
--			led_temp  <= (others => '0');
--			licznik_0 <= 0;
--            licznik_1 <= 0;
--            licznik_2 <= 0;
--            licznik_3 <= 0;
--            tick_0 <= '0';
--            tick_1 <= '0';
--            tick_2 <= '0';
--            tick_3 <= '0';
--		elsif rising_edge (clk_i) then
--			case counter_state is
--				when RESET =>
--					led_temp <= (others => '0');
--                    licznik_0 <= 0;
--                    licznik_1 <= 0;
--                    licznik_2 <= 0;
--                    licznik_3 <= 0;
--                    tick_0 <= '0';
--                    tick_1 <= '0';
--                    tick_2 <= '0';
--                    tick_3 <= '0';
--				when START =>
--					  if (tick_0 = '1') then
--					       led_temp(0) <= not led_temp(0);
--					  end if;
--					  if (tick_1 = '1') then
--					       led_temp(1) <= not led_temp(1);
--					  end if;
--					  if (tick_2 = '1') then
--                           led_temp(2) <= not led_temp(2);
--                      end if;
--                      if (tick_3 = '1') then
--                           led_temp(3) <= not led_temp(3);
--                      end if;
--				when STOP =>
--				when OTHERS =>
--					led_temp <= (others => '0');		
--			end case;
--		end if;
--	end process proces_time_counter;
	
--led(3 downto 0) <= led_temp(3 downto 0);

end Behavioral;
