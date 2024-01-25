----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:28 12/17/2023 
-- Design Name: 
-- Module Name:    edge_detector - Behavioral 
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

entity edge_detector is
	Port (s1 : in STD_LOGIC;
	      clk : in STD_LOGIC;
	      rst : in STD_LOGIC;
	      s1_edges : out STD_LOGIC);
end edge_detector;


architecture Behavioral of edge_detector is
	
	signal s1_d : std_logic;
	
begin

	process(clk, rst)
	begin
		if rising_edge(clk) then 
			if rst = '1' then
				s1_d <= '0';
			else
				s1_d <= s1;
			end if;
		end if;
	end process;
	
	process(clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				s1_edges <= '0';
			else
				if s1_d = '1' and s1 = '0' then
					s1_edges <= '1';
				else 
					s1_edges <= '0';
				end if;
			end if;
		end if;
	end process;

end Behavioral;

