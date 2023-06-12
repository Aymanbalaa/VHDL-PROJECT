entity ProjectTest is
  generic ( Max_Occupancy : integer=63);
port( X : in std_logic ;
      Y : in std_logic ;
     max_occupancy : in integer range form 0 to Max_Occupancy;
     Reset : in std_logic;
     Full : out std_logic;
     Red_Light : out std_logic);

  end entity ProjectTest;
