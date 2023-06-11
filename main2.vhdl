library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity PeopleCounter is
    Port ( 
           reset : in STD_LOGIC;                      -- Reset signal
           max_occupancy : in STD_LOGIC_VECTOR(5 downto 0); -- Maximum occupancy signal (up to 63)
           photocell_X : in  STD_LOGIC;
           photocell_Y : in  STD_LOGIC;   -- Photocell input signals
           red_light : out  STD_LOGIC);                -- Output signal for the red light
end PeopleCounter;

architecture Behavioral of PeopleCounter is
    signal occupancy : std_logic_vector(5 downto 0);  -- Counter to keep track of the number of people
begin
    process(max_occupancy, reset, photocell_X, photocell_Y)
    begin
        if reset = '1' then                 -- Reset the system
            occupancy <= (others => '0');
            red_light <= '0';
        else        -- Increment or decrement the count based on photocell signals
            if photocell_X = '1' and photocell_Y= '0 and occupancy < max_occupancy then 
                occupancy <= occupancy + 1;            
            elsif photocell_X = '0' and photocell_Y= '1' and occupancy > 0 then
                occupancy <= occupancy - 1;
            end if;

            
            if occupancy = max_occupancy then    -- Room is full, activate the red light
                red_light <= '1';
            else
                red_light <= '0';
            end if;
        end if;
    end process;
end Behavioral;
