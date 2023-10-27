-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Fri Oct 27 12:26:49 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Monothonic_synth IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		C :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		E :  IN  STD_LOGIC;
		F :  IN  STD_LOGIC;
		G :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC;
		speed_up :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		en :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		sequence_enab :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		BPM_dis :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0);
		i_data :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END Monothonic_synth;

ARCHITECTURE bdf_type OF Monothonic_synth IS 

COMPONENT wavegenerator
	PORT(clkDiv : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 en : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 note : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		 i_data : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sequencer
	PORT(clk : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 reset_BPM : IN STD_LOGIC;
		 BPM : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
		 input : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 sequence_enab : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 note : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
	);
END COMPONENT;

COMPONENT keyboard
	PORT(C : IN STD_LOGIC;
		 D : IN STD_LOGIC;
		 E : IN STD_LOGIC;
		 F : IN STD_LOGIC;
		 G : IN STD_LOGIC;
		 A : IN STD_LOGIC;
		 input : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT adjust_bpm
	PORT(speed_up : IN STD_LOGIC;
		 reset_BPM : OUT STD_LOGIC;
		 BPM : OUT STD_LOGIC_VECTOR(26 DOWNTO 0);
		 BPM_dis : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT clockdiv
	PORT(clk : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clkDiv : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	clkDiv :  STD_LOGIC;
SIGNAL	input :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	note :  STD_LOGIC_VECTOR(12 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(26 DOWNTO 0);


BEGIN 



b2v_inst : wavegenerator
PORT MAP(clkDiv => clkDiv,
		 nrst => nrst,
		 en => en,
		 note => note,
		 i_data => i_data);


b2v_inst1 : sequencer
PORT MAP(clk => clk,
		 nrst => nrst,
		 reset_BPM => SYNTHESIZED_WIRE_0,
		 BPM => SYNTHESIZED_WIRE_1,
		 input => input,
		 sequence_enab => sequence_enab,
		 note => note);


b2v_inst3 : keyboard
PORT MAP(C => C,
		 D => D,
		 E => E,
		 F => F,
		 G => G,
		 A => A,
		 input => input);


b2v_inst5 : adjust_bpm
PORT MAP(speed_up => speed_up,
		 reset_BPM => SYNTHESIZED_WIRE_0,
		 BPM => SYNTHESIZED_WIRE_1,
		 BPM_dis => BPM_dis);


b2v_inst6 : clockdiv
PORT MAP(clk => clk,
		 nrst => nrst,
		 clkDiv => clkDiv);


END bdf_type;