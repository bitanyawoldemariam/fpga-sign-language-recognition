library IEEE;
 
use IEEE.STD_LOGIC_1164.ALL;

entity gesture_classifier is
 
    Port (
 
        thumb    : in  STD_LOGIC;
 
        index_f  : in  STD_LOGIC;
 
        middle_f : in  STD_LOGIC;
 
        ring_f   : in  STD_LOGIC;
 
        pinky_f  : in  STD_LOGIC;
 
        gesture  : out STD_LOGIC_VECTOR(4 downto 0)
 
    );
 
end gesture_classifier;

architecture Behavioral of gesture_classifier is
 
begin
 
    -- '0' = bent, '1' = straight
 
    -- We invert so gesture bit = '1' means bent
 
    -- to match your original encoding table
 
    gesture(4) <=  thumb;
 
    gesture(3) <=  index_f;
 
    gesture(2) <=  middle_f;
 
    gesture(1) <=  ring_f;
 
    gesture(0) <=  pinky_f;
 
end Behavioral;

 