----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:11 12/17/2023 
-- Design Name: 
-- Module Name:    pulse_generator - Behavioral 
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

entity pulse_generator is
	Port (start : in STD_LOGIC;
			clk : in STD_LOGIC;
			rst : in STD_LOGIC;
			pulse : out STD_LOGIC);
end pulse_generator;


architecture Behavioral of pulse_generator is

signal counter : integer := 0;
signal start_sync : STD_LOGIC := '0';

begin
	process(clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
			counter <= 0;
			start_sync <= '0';
			pulse <= '0';
			else
				if start = '1' then
					start_sync <= '1';
					pulse <= '1';
				end if;
				if start_sync = '1' then
					counter <= counter + 1;
				end if;
				if counter >= 49 then
					pulse <= '0';
					start_sync <= '0';
					counter <= 0;
				end if;
			end if;
		end if;
	end process;
				
end Behavioral;

