----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:01 12/17/2023 
-- Design Name: 
-- Module Name:    act_sensor - Behavioral 
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

entity act_sensor is
	Port ( s1 : in STD_LOGIC;
			start : in STD_LOGIC;
			clk : in STD_LOGIC;
			rst : in STD_LOGIC;
			edges : out STD_LOGIC_VECTOR(7 downto 0);
			ready : out STD_LOGIC);
end act_sensor;

architecture Behavioral of act_sensor is
	component pulse_generator is
			Port (start, clk, rst : in STD_LOGIC;
					pulse : out STD_LOGIC);
		end component;
		
	component edge_detector is
		Port (s1, clk, rst : in STD_LOGIC;
				s1_edges : out STD_LOGIC);
	end component;
	
	component edge_counter is
		Port (s1_edges, start, pulse, clk, rst : in STD_LOGIC;
				edges : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal s1_edges, pulse_gen_out : STD_LOGIC;
	signal edge_count_out : STD_LOGIC_VECTOR(7 downto 0);
	
begin

U0: pulse_generator port map (start => start,
										 clk => clk,
										 rst => rst,
										 pulse => pulse_gen_out);
									 
U1: edge_detector port map (s1 => s1,
									  clk => clk,
									  rst => rst,
									  s1_edges => s1_edges);
								  
U2: edge_counter port map (s1_edges => s1_edges,
									 start => start,
									 pulse => pulse_gen_out,
									 clk => clk,
									 rst => rst,
									 edges => edge_count_out);

ready <= not pulse_gen_out;
edges <= edge_count_out;

end Behavioral;

