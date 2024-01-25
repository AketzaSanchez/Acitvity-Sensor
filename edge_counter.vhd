----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:41 12/17/2023 
-- Design Name: 
-- Module Name:    edge_counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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


entity edge_counter is
	 Port ( s1_edges : in STD_LOGIC;
           start : in STD_LOGIC;
           pulse : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           edges : out STD_LOGIC_VECTOR (7 downto 0));
			  
end edge_counter;


architecture Behavioral of edge_counter is

	signal count : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
begin
	process(clk, rst)
	begin
		if falling_edge(clk) then
			if rst = '1' then
			count <= (others => '0');
			elsif start = '1' then
				count <= (others => '0');
			elsif (pulse = '1' and s1_edges = '1') then
				count <= count + 1;
			end if;
		end if;
	end process;

edges <= count;
	
end Behavioral;

