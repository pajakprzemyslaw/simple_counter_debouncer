----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.09.2018 17:38:51
-- Design Name: 
-- Module Name: decoder_display - Behavioral
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

entity decoder_display is
  Port
   ( 
       licz_0_o: in STD_LOGIC_VECTOR(1 downto 0);
       licz_1_o: in STD_LOGIC_VECTOR(1 downto 0);
       licz_2_o: in STD_LOGIC_VECTOR(1 downto 0);
       licz_3_o: in STD_LOGIC_VECTOR(1 downto 0);
          clk_i: in STD_LOGIC;
          res  : in STD_LOGIC
  );
end decoder_display;

architecture Behavioral of decoder_display is

constant D0 : STD_LOGIC_VECTOR(1 downto 0) := "00"; --abcdef-
constant D1 : STD_LOGIC_VECTOR(1 downto 0) := "01"; --bc
constant D2 : STD_LOGIC_VECTOR(1 downto 0) := "10"; --abdeg
constant D3 : STD_LOGIC_VECTOR(1 downto 0) := "11"; --abcdg
constant D_rest : STD_LOGIC_VECTOR(6 downto 0) := "0100100"; --acdfg
Type tablica is Array (0 to 4) of STD_LOGIC_VECTOR(6 downto 0);
Constant Table: tablica:=(D00,D01,D02,D03,D04,D05,D06,D07,D08,D09,D0A);

begin


end Behavioral;
