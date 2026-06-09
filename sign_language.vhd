
library IEEE;
 
use IEEE.STD_LOGIC_1164.ALL;

entity sign_language is
 
    Port (
 
        CLOCK_50 : in  STD_LOGIC;
 
        -- Flex sensors connected directly as digital inputs
 
        THUMB    : in  STD_LOGIC;   -- GPIO0  PIN_T21
 
        INDEX_F  : in  STD_LOGIC;   -- GPIO1  PIN_D26
 
        MIDDLE_F : in  STD_LOGIC;   -- GPIO2  PIN_K25
 
        RING_F   : in  STD_LOGIC;   -- GPIO3  PIN_E26
 
        PINKY_F  : in  STD_LOGIC;   -- GPIO4  PIN_K26
 
        -- 7-segment displays
 
        HEX0     : out STD_LOGIC_VECTOR(6 downto 0);
 
        HEX1     : out STD_LOGIC_VECTOR(6 downto 0);
 
        HEX2     : out STD_LOGIC_VECTOR(6 downto 0);
 
        HEX3     : out STD_LOGIC_VECTOR(6 downto 0)
 
    );
 
end sign_language;

architecture Behavioral of sign_language is

    component gesture_classifier
 
        Port (
 
            thumb    : in  STD_LOGIC;
 
            index_f  : in  STD_LOGIC;
 
            middle_f : in  STD_LOGIC;
 
            ring_f   : in  STD_LOGIC;
 
            pinky_f  : in  STD_LOGIC;
 
            gesture  : out STD_LOGIC_VECTOR(4 downto 0)
 
        );
 
    end component;

    component display_controller
 
        Port (
 
            gesture : in  STD_LOGIC_VECTOR(4 downto 0);
 
            HEX0    : out STD_LOGIC_VECTOR(6 downto 0);
 
            HEX1    : out STD_LOGIC_VECTOR(6 downto 0);
 
            HEX2    : out STD_LOGIC_VECTOR(6 downto 0);
 
            HEX3    : out STD_LOGIC_VECTOR(6 downto 0)
 
        );
 
    end component;

    -- Debounced signals
 
    signal thumb_db    : STD_LOGIC;
 
    signal index_db    : STD_LOGIC;
 
    signal middle_db   : STD_LOGIC;
 
    signal ring_db     : STD_LOGIC;
 
    signal pinky_db    : STD_LOGIC;

    signal gesture     : STD_LOGIC_VECTOR(4 downto 0);

    -- Debounce counters (20 bits = ~20ms at 50MHz)
 
    signal cnt_thumb   : integer range 0 to 1000000 := 0;
 
    signal cnt_index   : integer range 0 to 1000000 := 0;
 
    signal cnt_middle  : integer range 0 to 1000000 := 0;
 
    signal cnt_ring    : integer range 0 to 1000000 := 0;
 
    signal cnt_pinky   : integer range 0 to 1000000 := 0;

    constant DEBOUNCE  : integer := 1000000; -- 20ms at 50MHz

begin

    -- Debounce each sensor input
 
    -- Prevents flickering at the threshold boundary
 
    process(CLOCK_50)
 
    begin
 
        if rising_edge(CLOCK_50) then
 
            -- Thumb
 
            if THUMB /= thumb_db then
 
                if cnt_thumb = DEBOUNCE then
 
                    thumb_db  <= THUMB;
 
                    cnt_thumb <= 0;
 
                else
 
                    cnt_thumb <= cnt_thumb + 1;
 
                end if;
 
            else
 
                cnt_thumb <= 0;
 
            end if;

            -- Index
 
            if INDEX_F /= index_db then
 
                if cnt_index = DEBOUNCE then
 
                    index_db  <= INDEX_F;
 
                    cnt_index <= 0;
 
                else
 
                    cnt_index <= cnt_index + 1;
 
                end if;
 
            else
 
                cnt_index <= 0;
 
            end if;

            -- Middle
 
            if MIDDLE_F /= middle_db then
 
                if cnt_middle = DEBOUNCE then
 
                    middle_db  <= MIDDLE_F;
 
                    cnt_middle <= 0;
 
                else
 
                    cnt_middle <= cnt_middle + 1;
 
                end if;
 
            else
 
                cnt_middle <= 0;
 
            end if;

            -- Ring
 
            if RING_F /= ring_db then
 
                if cnt_ring = DEBOUNCE then
 
                    ring_db  <= RING_F;
 
                    cnt_ring <= 0;
 
                else
 
                    cnt_ring <= cnt_ring + 1;
 
                end if;
 
            else
 
                cnt_ring <= 0;
 
            end if;

            -- Pinky
 
            if PINKY_F /= pinky_db then
 
                if cnt_pinky = DEBOUNCE then
 
                    pinky_db  <= PINKY_F;
 
                    cnt_pinky <= 0;
 
                else
 
                    cnt_pinky <= cnt_pinky + 1;
 
                end if;
 
            else
 
                cnt_pinky <= 0;
 
            end if;

        end if;
 
    end process;

    CLASS : gesture_classifier port map (
 
        thumb    => thumb_db,
 
        index_f  => index_db,
 
        middle_f => middle_db,
 
        ring_f   => ring_db,
 
        pinky_f  => pinky_db,
 
        gesture  => gesture
 
    );

    DISP : display_controller port map (
 
        gesture => gesture,
 
        HEX0    => HEX0,
 
        HEX1    => HEX1,
 
        HEX2    => HEX2,
 
        HEX3    => HEX3
 
    );

end Behavioral;

