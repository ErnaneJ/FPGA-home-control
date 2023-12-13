library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definição da entidade
entity homeControll is
    Port (
        main_led : OUT STD_LOGIC; -- Luz da casa (LED)
        main_swich : IN STD_LOGIC; -- swich para a luz da casa (swich)

        room_1_led : OUT STD_LOGIC; -- Luz do quarto 1 (LED)
        room_1_swich : IN STD_LOGIC; -- swich para a luz do quarto 1 (swich)

        room_2_led : OUT STD_LOGIC; -- Luz do quarto 2 (LED)
        room_2_swich : IN STD_LOGIC; -- swich para a luz do quarto 2 (swich)

        room_3_led : OUT STD_LOGIC; -- Luz do quarto 3 (LED)
        room_3_swich : IN STD_LOGIC; -- swich para a luz do quarto 3 (swich)

        intensity_control : IN STD_LOGIC; -- controlador de intensidade (push_button)
        intensity_1 : OUT STD_LOGIC; -- Marcador de intensidade 1 (LED)
        intensity_2 : OUT STD_LOGIC; -- Marcador de intensidade 2 (LED)
        intensity_3 : OUT STD_LOGIC; -- Marcador de intensidade 3 (LED)
        intensity_4 : OUT STD_LOGIC; -- Marcador de intensidade 4 (LED)
        intensity_5 : OUT STD_LOGIC; -- Marcador de intensidade 5 (LED)
        
        timer_switch : IN STD_LOGIC; -- switch para controle do timer (swich)
        timer_led : OUT STD_LOGIC;  -- LED de saída

        night_mode : IN STD_LOGIC; -- Modo noturno (swich)
      
        -- Visualização no display de 7 segmentos:
        hex_0_a : OUT STD_LOGIC;
        hex_0_b : OUT STD_LOGIC;
        hex_0_c : OUT STD_LOGIC;
        hex_0_d : OUT STD_LOGIC;
        hex_0_e : OUT STD_LOGIC;
        hex_0_f : OUT STD_LOGIC;
        hex_0_g : OUT STD_LOGIC
    );
end homeControll;

-- Arquitetura
architecture Behavioral of homeControll is
    signal counter : STD_LOGIC_VECTOR(2 downto 0) := "001"; -- Inicia o contador em 1
begin
    process(main_swich, room_1_swich, room_2_swich, room_3_swich, intensity_control, timer_switch) is
    begin
        if main_swich = '1' then  -- Switch ON (assumindo que '1' é nível alto)
            main_led <= '1';  -- Acende o LED
            intensity_1 <= '1';

            if room_1_swich = '1' then
                room_1_led <= '1';
            else
                room_1_led <= '0';
            end if;

            if room_2_swich = '1' then
                room_2_led <= '1';
            else
                room_2_led <= '0';
            end if;

            if room_3_swich = '1' then
                room_3_led <= '1';
            else
                room_3_led <= '0';
            end if;
        
        -- intensity
         if (intensity_control'EVENT and intensity_control = '0') then  -- Push button ON (assumindo que '1' é nível alto)
          counter <= counter + "001";  -- Incrementa o contador
          
          if night_mode = '1' AND counter = "011" then
             counter <= "001";
          end if;

          if counter = "001" then -- Se o contador for igual a 2 (assumindo que '010' é 2)
             intensity_1 <= '1'; -- Acende o LED
             intensity_2 <= '0'; -- Desliga o LED
             intensity_3 <= '0'; -- Desliga o LED
             intensity_4 <= '0'; -- Desliga o LED
             intensity_5 <= '0'; -- Desliga o LED
             
             -- Visualização no display da itensidade 1
             hex_0_a <= '1';
             hex_0_b <= '0';
             hex_0_c <= '0';
             hex_0_d <= '1';
             hex_0_e <= '1';
             hex_0_f <= '1';
             hex_0_g <= '1';
          elsif counter = "010" then -- Se o contador for igual a 2 (assumindo que '010' é 2)
             intensity_1 <= '1'; -- Acende o LED
             intensity_2 <= '1'; -- Acende o LED
             intensity_3 <= '0'; -- Desliga o LED
             intensity_4 <= '0'; -- Desliga o LED
             intensity_5 <= '0'; -- Desliga o LED
             
             -- Visualização no display da itensidade 2
             hex_0_a <= '0';
             hex_0_b <= '0';
             hex_0_c <= '1';
             hex_0_d <= '0';
             hex_0_e <= '0';
             hex_0_f <= '1';
             hex_0_g <= '0';
          elsif counter = "011" then -- Se o contador for igual a 3 (assumindo que '011' é 3)
             intensity_1 <= '1'; -- Acende o LED
             intensity_2 <= '1'; -- Acende o LED
             intensity_3 <= '1'; -- Acende o LED
             intensity_4 <= '0'; -- Desliga o LED
             intensity_5 <= '0'; -- Desliga o LED

             -- Visualização no display da itensidade 3
             hex_0_a <= '0';
             hex_0_b <= '0';
             hex_0_c <= '0';
             hex_0_d <= '0';
             hex_0_e <= '1';
             hex_0_f <= '1';
             hex_0_g <= '0';
          elsif counter = "100" then -- Se o contador for igual a 4 (assumindo que '100' é 4)
             intensity_1 <= '1'; -- Acende o LED
             intensity_2 <= '1'; -- Acende o LED
             intensity_3 <= '1'; -- Acende o LED
             intensity_4 <= '1'; -- Acende o LED
             intensity_5 <= '0'; -- Desliga o LED

             -- Visualização no display da itensidade 4
             hex_0_a <= '1';
             hex_0_b <= '0';
             hex_0_c <= '0';
             hex_0_d <= '1';
             hex_0_e <= '1';
             hex_0_f <= '0';
             hex_0_g <= '0';
          else  -- Se o contador for igual a 5
             counter <= "001"; 
             intensity_1 <= '1'; -- Acende o LED
             intensity_2 <= '1'; -- Acende o LED
             intensity_3 <= '1'; -- Acende o LED
             intensity_4 <= '1'; -- Acende o LED
             intensity_5 <= '1'; -- Acende o LED

             -- Visualização no display da itensidade 5
             hex_0_a <= '0';
             hex_0_b <= '1';
             hex_0_c <= '0';
             hex_0_d <= '0';
             hex_0_e <= '1';
             hex_0_f <= '0';
             hex_0_g <= '0';
          end if;
        end if;
        else 
            main_led <= '0';  -- Desliga o LED
            intensity_1 <= '0'; -- Desliga o LED
            intensity_2 <= '0'; -- Desliga o LED
            intensity_3 <= '0'; -- Desliga o LED
            intensity_4 <= '0'; -- Desliga o LED
            intensity_5 <= '0'; -- Desliga o LED

            room_1_led <= '0';
            room_2_led <= '0';
            room_3_led <= '0';
        end if;
    end process;
end Behavioral;
