library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity PeopleCounter is
    Port ( clk : in  STD_LOGIC;                       -- Clock signal
           reset : in STD_LOGIC;                      -- Reset signal
           max_occupancy : in  STD_LOGIC_VECTOR(5 downto 0); -- Maximum occupancy signal (up to 63)
           photocell_in : in  STD_LOGIC_VECTOR(1 downto 0);   -- Photocell input signals
           light_out : out  STD_LOGIC);                -- Output signal for the red light
end PeopleCounter;

architecture Behavioral of PeopleCounter is
    signal count : std_logic_vector(5 downto 0);  -- Counter to keep track of the number of people
begin
    process(clk, reset)
    begin
        if reset = '1' then                 -- Reset the system
            count <= (others => '0');
            light_out <= '0';
        elsif rising_edge(clk) then         -- Increment or decrement the count based on photocell signals
            if photocell_in(0) = '1' then   -- Person entering the room
                if count < max_occupancy then
                    count <= count + 1;
                end if;
            elsif photocell_in(1) = '1' then  -- Person leaving the room
                if count > 0 then
                    count <= count - 1;
                end if;
            end if;
            
            if count = max_occupancy then    -- Room is full, activate the red light
                light_out <= '1';
            else
                light_out <= '0';
            end if;
        end if;
    end process;
end Behavioral;
