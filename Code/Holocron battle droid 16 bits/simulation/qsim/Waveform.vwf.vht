-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/02/2017 02:06:15"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Multiplier_2x16
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Multiplier_2x16_vhd_vec_tst IS
END Multiplier_2x16_vhd_vec_tst;
ARCHITECTURE Multiplier_2x16_arch OF Multiplier_2x16_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carryOut : STD_LOGIC;
SIGNAL input_A : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL input_B : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL outputHigh : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL outputLow : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Multiplier_2x16
	PORT (
	carryOut : OUT STD_LOGIC;
	input_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	input_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	outputHigh : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	outputLow : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Multiplier_2x16
	PORT MAP (
-- list connections between master ports and signals
	carryOut => carryOut,
	input_A => input_A,
	input_B => input_B,
	outputHigh => outputHigh,
	outputLow => outputLow
	);
-- input_A[15]
t_prcs_input_A_15: PROCESS
BEGIN
	input_A(15) <= '0';
WAIT;
END PROCESS t_prcs_input_A_15;
-- input_A[14]
t_prcs_input_A_14: PROCESS
BEGIN
	input_A(14) <= '0';
WAIT;
END PROCESS t_prcs_input_A_14;
-- input_A[13]
t_prcs_input_A_13: PROCESS
BEGIN
	input_A(13) <= '0';
WAIT;
END PROCESS t_prcs_input_A_13;
-- input_A[12]
t_prcs_input_A_12: PROCESS
BEGIN
	input_A(12) <= '0';
WAIT;
END PROCESS t_prcs_input_A_12;
-- input_A[11]
t_prcs_input_A_11: PROCESS
BEGIN
	input_A(11) <= '0';
WAIT;
END PROCESS t_prcs_input_A_11;
-- input_A[10]
t_prcs_input_A_10: PROCESS
BEGIN
	input_A(10) <= '0';
WAIT;
END PROCESS t_prcs_input_A_10;
-- input_A[9]
t_prcs_input_A_9: PROCESS
BEGIN
	input_A(9) <= '0';
WAIT;
END PROCESS t_prcs_input_A_9;
-- input_A[8]
t_prcs_input_A_8: PROCESS
BEGIN
	input_A(8) <= '0';
WAIT;
END PROCESS t_prcs_input_A_8;
-- input_A[7]
t_prcs_input_A_7: PROCESS
BEGIN
	input_A(7) <= '0';
WAIT;
END PROCESS t_prcs_input_A_7;
-- input_A[6]
t_prcs_input_A_6: PROCESS
BEGIN
	input_A(6) <= '0';
	WAIT FOR 640000 ps;
	input_A(6) <= '1';
WAIT;
END PROCESS t_prcs_input_A_6;
-- input_A[5]
t_prcs_input_A_5: PROCESS
BEGIN
	input_A(5) <= '0';
	WAIT FOR 320000 ps;
	input_A(5) <= '1';
	WAIT FOR 320000 ps;
	input_A(5) <= '0';
	WAIT FOR 320000 ps;
	input_A(5) <= '1';
WAIT;
END PROCESS t_prcs_input_A_5;
-- input_A[4]
t_prcs_input_A_4: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		input_A(4) <= '0';
		WAIT FOR 160000 ps;
		input_A(4) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	input_A(4) <= '0';
WAIT;
END PROCESS t_prcs_input_A_4;
-- input_A[3]
t_prcs_input_A_3: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		input_A(3) <= '0';
		WAIT FOR 80000 ps;
		input_A(3) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	input_A(3) <= '0';
WAIT;
END PROCESS t_prcs_input_A_3;
-- input_A[2]
t_prcs_input_A_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		input_A(2) <= '0';
		WAIT FOR 40000 ps;
		input_A(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	input_A(2) <= '0';
WAIT;
END PROCESS t_prcs_input_A_2;
-- input_A[1]
t_prcs_input_A_1: PROCESS
BEGIN
LOOP
	input_A(1) <= '0';
	WAIT FOR 20000 ps;
	input_A(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_input_A_1;
-- input_A[0]
t_prcs_input_A_0: PROCESS
BEGIN
LOOP
	input_A(0) <= '0';
	WAIT FOR 10000 ps;
	input_A(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_input_A_0;
-- input_B[15]
t_prcs_input_B_15: PROCESS
BEGIN
	input_B(15) <= '0';
WAIT;
END PROCESS t_prcs_input_B_15;
-- input_B[14]
t_prcs_input_B_14: PROCESS
BEGIN
	input_B(14) <= '0';
WAIT;
END PROCESS t_prcs_input_B_14;
-- input_B[13]
t_prcs_input_B_13: PROCESS
BEGIN
	input_B(13) <= '0';
WAIT;
END PROCESS t_prcs_input_B_13;
-- input_B[12]
t_prcs_input_B_12: PROCESS
BEGIN
	input_B(12) <= '0';
WAIT;
END PROCESS t_prcs_input_B_12;
-- input_B[11]
t_prcs_input_B_11: PROCESS
BEGIN
	input_B(11) <= '0';
WAIT;
END PROCESS t_prcs_input_B_11;
-- input_B[10]
t_prcs_input_B_10: PROCESS
BEGIN
	input_B(10) <= '0';
WAIT;
END PROCESS t_prcs_input_B_10;
-- input_B[9]
t_prcs_input_B_9: PROCESS
BEGIN
	input_B(9) <= '0';
WAIT;
END PROCESS t_prcs_input_B_9;
-- input_B[8]
t_prcs_input_B_8: PROCESS
BEGIN
	input_B(8) <= '0';
WAIT;
END PROCESS t_prcs_input_B_8;
-- input_B[7]
t_prcs_input_B_7: PROCESS
BEGIN
	input_B(7) <= '0';
WAIT;
END PROCESS t_prcs_input_B_7;
-- input_B[6]
t_prcs_input_B_6: PROCESS
BEGIN
	input_B(6) <= '0';
WAIT;
END PROCESS t_prcs_input_B_6;
-- input_B[5]
t_prcs_input_B_5: PROCESS
BEGIN
	input_B(5) <= '0';
WAIT;
END PROCESS t_prcs_input_B_5;
-- input_B[4]
t_prcs_input_B_4: PROCESS
BEGIN
	input_B(4) <= '0';
	WAIT FOR 640000 ps;
	input_B(4) <= '1';
WAIT;
END PROCESS t_prcs_input_B_4;
-- input_B[3]
t_prcs_input_B_3: PROCESS
BEGIN
	input_B(3) <= '0';
	WAIT FOR 320000 ps;
	input_B(3) <= '1';
	WAIT FOR 320000 ps;
	input_B(3) <= '0';
	WAIT FOR 320000 ps;
	input_B(3) <= '1';
WAIT;
END PROCESS t_prcs_input_B_3;
-- input_B[2]
t_prcs_input_B_2: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		input_B(2) <= '0';
		WAIT FOR 160000 ps;
		input_B(2) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	input_B(2) <= '0';
WAIT;
END PROCESS t_prcs_input_B_2;
-- input_B[1]
t_prcs_input_B_1: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		input_B(1) <= '0';
		WAIT FOR 80000 ps;
		input_B(1) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	input_B(1) <= '0';
WAIT;
END PROCESS t_prcs_input_B_1;
-- input_B[0]
t_prcs_input_B_0: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		input_B(0) <= '0';
		WAIT FOR 40000 ps;
		input_B(0) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	input_B(0) <= '0';
WAIT;
END PROCESS t_prcs_input_B_0;
END Multiplier_2x16_arch;
