 
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity display_controller is

    Port (

        gesture : in  STD_LOGIC_VECTOR(4 downto 0);

        HEX0    : out STD_LOGIC_VECTOR(6 downto 0);

        HEX1    : out STD_LOGIC_VECTOR(6 downto 0);

        HEX2    : out STD_LOGIC_VECTOR(6 downto 0);

        HEX3    : out STD_LOGIC_VECTOR(6 downto 0)

    );

end display_controller;

architecture Behavioral of display_controller is

    constant SEG_A : STD_LOGIC_VECTOR(6 downto 0) := "0001000";

    constant SEG_B : STD_LOGIC_VECTOR(6 downto 0) := "0000011";

    constant SEG_C : STD_LOGIC_VECTOR(6 downto 0) := "1000110";

    constant SEG_D : STD_LOGIC_VECTOR(6 downto 0) := "0100001";

    constant SEG_E : STD_LOGIC_VECTOR(6 downto 0) := "0000110";

    constant SEG_F : STD_LOGIC_VECTOR(6 downto 0) := "0001110";

    constant SEG_G : STD_LOGIC_VECTOR(6 downto 0) := "1000010";

    constant SEG_H : STD_LOGIC_VECTOR(6 downto 0) := "0001001";

    constant SEG_I : STD_LOGIC_VECTOR(6 downto 0) := "1111011";

    constant SEG_J : STD_LOGIC_VECTOR(6 downto 0) := "1100001";

    constant SEG_K : STD_LOGIC_VECTOR(6 downto 0) := "0001001";

    constant SEG_L : STD_LOGIC_VECTOR(6 downto 0) := "1000111";

    constant SEG_M : STD_LOGIC_VECTOR(6 downto 0) := "0101010";

    constant SEG_N : STD_LOGIC_VECTOR(6 downto 0) := "0101011";

    constant SEG_O : STD_LOGIC_VECTOR(6 downto 0) := "1000000";

    constant SEG_P : STD_LOGIC_VECTOR(6 downto 0) := "0001100";

    constant SEG_Q : STD_LOGIC_VECTOR(6 downto 0) := "0011000";

    constant SEG_R : STD_LOGIC_VECTOR(6 downto 0) := "0101111";

    constant SEG_S : STD_LOGIC_VECTOR(6 downto 0) := "0010010";

    constant SEG_T : STD_LOGIC_VECTOR(6 downto 0) := "0000111";

    constant SEG_U : STD_LOGIC_VECTOR(6 downto 0) := "1000001";

    constant SEG_V : STD_LOGIC_VECTOR(6 downto 0) := "1100011";

    constant SEG_W : STD_LOGIC_VECTOR(6 downto 0) := "0010101";

    constant SEG_X : STD_LOGIC_VECTOR(6 downto 0) := "0001001";

    constant SEG_Y : STD_LOGIC_VECTOR(6 downto 0) := "0010001";

    constant SEG_Z : STD_LOGIC_VECTOR(6 downto 0) := "0100100";

    constant SEG_BLANK : STD_LOGIC_VECTOR(6 downto 0) := "1111111";

begin

    process(gesture)

    begin

        HEX0 <= SEG_BLANK;

        HEX1 <= SEG_BLANK;

        HEX2 <= SEG_BLANK;

        HEX3 <= SEG_BLANK;

        case gesture is

            -- Letters A-Z on HEX0

            when "00000" => HEX0 <= SEG_A;

            when "00001" => HEX0 <= SEG_B;

            when "00010" => HEX0 <= SEG_C;

            when "00011" => HEX0 <= SEG_D;

            when "00100" => HEX0 <= SEG_E;

            when "00101" => HEX0 <= SEG_F;

            when "00110" => HEX0 <= SEG_G;

            when "00111" => HEX0 <= SEG_H;

            when "01000" => HEX0 <= SEG_I;

            when "01001" => HEX0 <= SEG_J;

            when "01010" => HEX0 <= SEG_K;

            when "01011" => HEX0 <= SEG_L;

            when "01100" => HEX0 <= SEG_M;

            when "01101" => HEX0 <= SEG_N;

            when "01110" => HEX0 <= SEG_O;

            when "01111" => HEX0 <= SEG_P;

            when "10000" => HEX0 <= SEG_Q;

            when "10001" => HEX0 <= SEG_R;

            when "10010" => HEX0 <= SEG_S;

            when "10011" => HEX0 <= SEG_T;

            when "10100" => HEX0 <= SEG_U;

            when "10101" => HEX0 <= SEG_V;

            when "10110" => HEX0 <= SEG_W;

            when "10111" => HEX0 <= SEG_X;

            when "11000" => HEX0 <= SEG_Y;

            when "11001" => HEX0 <= SEG_Z;

            -- Special phrases across all 4 displays

            when "11010" => -- Hello

                HEX3<=SEG_H; HEX2<=SEG_E; HEX1<=SEG_L; HEX0<=SEG_O;

            when "11011" => -- How are you: H A r Y

                HEX3<=SEG_H; HEX2<=SEG_A; HEX1<=SEG_R; HEX0<=SEG_Y;

            when "11100" => -- Thank You: t H n K

                HEX3<=SEG_T; HEX2<=SEG_H; HEX1<=SEG_N; HEX0<=SEG_K;

            when "11101" => -- Please: P L E A

                HEX3<=SEG_P; HEX2<=SEG_L; HEX1<=SEG_E; HEX0<=SEG_A;

            when "11110" => -- Good: G o o d

                HEX3<=SEG_G; HEX2<=SEG_O; HEX1<=SEG_O; HEX0<=SEG_D;

            when "11111" => -- Help: H E L P

                HEX3<=SEG_H; HEX2<=SEG_E; HEX1<=SEG_L; HEX0<=SEG_P;

            when others =>

                HEX0 <= SEG_BLANK;

        end case;

    end process;

end Behavioral;
 
