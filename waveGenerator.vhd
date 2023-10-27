library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity waveGenerator is
	port (clkDiv     	: in std_logic;
			nrst			: in std_logic;
			en		  		: in std_logic_vector(1 downto 0);
			note			: in std_logic_vector(12 downto 0);
			i_data 		: out std_logic_vector(8 downto 0));
end waveGenerator;

architecture Behavioral of waveGenerator is

---------------------------------------------SQUARE WAVES-------------------------------------------------------------------
signal C4sqr : integer range 0 to 95 := 0;
type C4sqr_memory is array (0 to 95) of integer range 0 to 255;
signal C4square : C4sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal D4sqr : integer range 0 to 85 := 0;
type D4sqr_memory is array (0 to 85) of integer range 0 to 255;
signal D4square : D4sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal E4sqr : integer range 0 to 75 := 0;
type E4sqr_memory is array (0 to 75) of integer range 0 to 255;
signal E4square : E4sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal F4sqr : integer range 0 to 71 := 0;
type F4sqr_memory is array (0 to 71) of integer range 0 to 255;
signal F4square : F4sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal G4sqr : integer range 0 to 63 := 0;
type G4sqr_memory is array (0 to 63) of integer range 0 to 255;
signal G4square : G4sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal A5sqr : integer range 0 to 56 := 0;
type A5sqr_memory is array (0 to 56) of integer range 0 to 255;
signal A5square : A5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal B5sqr : integer range 0 to 50 := 0;
type B5sqr_memory is array (0 to 50) of integer range 0 to 255;
signal B5square : B5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal C5sqr : integer range 0 to 47 := 0;
type C5sqr_memory is array (0 to 47) of integer range 0 to 255;
signal C5square : C5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal D5sqr : integer range 0 to 42 := 0;
type D5sqr_memory is array (0 to 42) of integer range 0 to 255;
signal D5square : D5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal E5sqr : integer range 0 to 37 := 0;
type E5sqr_memory is array (0 to 37) of integer range 0 to 255;
signal E5square : E5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal F5sqr : integer range 0 to 35 := 0;
type F5sqr_memory is array (0 to 35) of integer range 0 to 255;
signal F5square : F5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal G5sqr : integer range 0 to 31 := 0;
type G5sqr_memory is array (0 to 31) of integer range 0 to 255;
signal G5square : G5sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

signal A6sqr : integer range 0 to 28 := 0;
type A6sqr_memory is array (0 to 28) of integer range 0 to 255;
signal A6square : A6sqr_memory :=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255);

---------------------------------------------SINE WAVES---------------------------------------------------------------------
signal C4sn : integer range 0 to 95 := 0;
type C4sn_memory is array (0 to 95) of integer range 0 to 255;
signal C4sine : C4sn_memory :=(127,135,144,152,160,168,176,184,191,198,205,211,218,223,228,233,238,242,245,248,250,252,253,254,254,254,253,251,249,246,243,240,236,231,226,220,215,208,202,195,187,180,172,164,156,148,140,131,123,114,106,98,90,82,74,67,59,52,46,39,34,28,23,18,14,11,8,5,3,1,0,0,0,1,2,4,6,9,12,16,21,26,31,36,43,49,56,63,70,78,86,94,102,110,119,127);

signal D4sn : integer range 0 to 85 := 0;
type D4sn_memory is array (0 to 85) of integer range 0 to 255;
signal D4sine : D4sn_memory :=(127,136,145,155,164,172,181,189,197,205,212,218,225,230,235,240,244,247,250,252,253,254,254,253,252,250,247,244,240,233,230,225,218,212,205,197,189,181,172,164,155,145,136,127,118,109,99,90,82,73,65,57,49,42,36,29,24,19,14,10,7,4,2,1,0,0,1,2,4,7,10,14,19,24,29,36,42,49,57,65,73,82,90,99,109,118);

signal E4sn : integer range 0 to 75 := 0;
type E4sn_memory is array (0 to 75) of integer range 0 to 255;
signal E4sine : E4sn_memory :=(127,137,148,158,168,178,187,196,205,213,220,227,233,239,243,247,250,252,254,254,254,252,250,247,243,239,233,227,220,213,205,196,187,178,168,158,148,137,127,117,106,96,86,76,67,58,49,41,34,27,21,15,11,7,4,2,0,0,0,2,4,7,11,15,21,27,34,41,49,58,67,76,86,96,106,117);

signal F4sn : integer range 0 to 71 := 0;
type F4sn_memory is array (0 to 71) of integer range 0 to 255;
signal F4sine : F4sn_memory :=(127,138,149,160,170,181,191,200,209,217,224,231,237,242,246,250,252,254,254,254,252,250,246,242,237,231,224,217,209,200,190,181,170,160,149,138,127,116,105,94,84,73,63,54,45,37,30,23,17,12,8,4,2,0,0,0,2,4,8,12,17,23,30,37,45,54,64,73,84,94,105,116);

signal G4sn : integer range 0 to 63 := 0;
type G4sn_memory is array (0 to 63) of integer range 0 to 255;
signal G4sine : G4sn_memory :=(127,139,152,164,176,187,198,208,217,225,233,239,244,249,252,253,254,253,252,249,244,239,233,225,217,208,198,187,176,164,152,139,127,115,102,90,78,67,56,46,37,29,21,15,10,5,2,1,0,1,2,5,10,15,21,29,37,46,56,67,78,90,102,115);

signal A5sn : integer range 0 to 56 := 0;
type A5sn_memory is array (0 to 56) of integer range 0 to 255;
signal A5sine : A5sn_memory :=(127,141,155,168,181,194,205,216,225,233,240,246,250,253,254,254,252,248,243,237,229,220,210,199,187,175,162,148,134,120,106,92,79,67,55,44,34,25,17,11,6,2,0,0,1,4,8,14,21,29,38,49,60,73,99,113,127);
  
signal B5sn : integer range 0 to 50 := 0;
type B5sn_memory is array (0 to 50) of integer range 0 to 255;
signal B5sine : B5sn_memory :=( 127,143,158,173,187,200,213,223,233,241,247,251,253,254,252,249,244,237,228,218,207,194,180,166,150,135,119,104,88,74,60,47,36,26,17,10,5,2,0,1,3,7,13,21,31,41,54,67,81,96,111);

signal C5sn : integer range 0 to 47 := 0;
type C5sn_memory is array (0 to 47) of integer range 0 to 255;
signal C5sine : C5sn_memory :=(127,144,160,176,190,204,217,228,237,244,250,253,254,253,250,244,237,228,217,204,191,176,160,144,127,110,94,78,64,50,37,26,17,10,4,1,0,1,4,10,17,26,37,50,63,78,94,110);

signal D5sn : integer range 0 to 42 := 0;
type D5sn_memory is array (0 to 42) of integer range 0 to 255;
signal D5sine : D5sn_memory :=(127,145,164,181,197,212,225,235,244,250,253,254,252,247,240,230,218,205,189,172,155,136,118,99,82,65,49,36,24,14,7,2,0,1,4,10,19,29,42,57,73,90,109);

signal E5sn : integer range 0 to 37 := 0;
type E5sn_memory is array (0 to 37) of integer range 0 to 255;
signal E5sine : E5sn_memory :=(127,148,168,187,205,220,233,243,250,254,254,250,243,233,220,205,187,168,148,127,106,86,67,49,34,21,11,4,0,0,4,11,21,34,49,67,86,106);

signal F5sn : integer range 0 to 35 := 0;
type F5sn_memory is array (0 to 35) of integer range 0 to 255;
signal F5sine : F5sn_memory :=(127,149,170,190,209,224,237,246,252,254,252,246,237,224,209,190,170,149,127,105,84,63,45,30,17,8,2,0,2,8,17,30,45,64,84,105);

signal G5sn : integer range 0 to 32 := 0;
type G5sn_memory is array (0 to 32) of integer range 0 to 255;
signal G5sine : G5sn_memory :=(127,151,174,196,215,230,243,250,254,253,247,237,223,206,185,163,139,115,91,69,48,31,17,7,1,0,4,11,24,39,58,80,103);

signal A6sn : integer range 0 to 28 := 0;
type A6sn_memory is array (0 to 28) of integer range 0 to 255;
signal A6sine : A6sn_memory :=(127,154,180,204,224,239,249,254,252,245,232,214,192,168,141,113,86,62,40,22,9,2,0,5,15,30,50,74,100);
   
---------------------------------------------TRIANGLE WAVES-----------------------------------------------------------------
signal C4trngl : integer range 0 to 95 := 0;
type C4trngl_memory is array (0 to 95) of integer range 0 to 255;
signal C4triangle : C4trngl_memory :=(127,132,138,143,149,154,159,165,170,176,181,186,192,197,202,208,213,219,224,229,235,240,246,251,255,251,246,240,235,229,224,219,213,208,202,197,192,186,181,176,170,165,159,154,149,143,138,132,127,122,116,111,105,100,95,89,84,78,73,68,62,57,52,46,41,35,30,25,19,14,8,3,0,3,8,14,19,25,30,35,41,46,52,57,62,68,73,78,84,89,95,100,105,111,116,127);

signal D4trngl : integer range 0 to 85 := 0;
type D4trngl_memory is array (0 to 85) of integer range 0 to 255;
signal D4triangle : D4trngl_memory :=(127,133,139,145,151,157,163,169,175,181,187,193,199,205,211,217,223,229,235,241,247,253,247,241,235,229,223,217,211,205,199,193,187,181,175,169,163,157,151,145,139,133,127,121,115,109,103,97,91,85,79,73,67,61,55,49,43,37,31,25,19,13,7,1,7,13,19,25,31,37,43,49,55,61,67,73,79,85,91,97,103,109,115,121,127,127);

signal E4trngl : integer range 0 to 75 := 0;
type E4trngl_memory is array (0 to 75) of integer range 0 to 255;
signal E4triangle : E4trngl_memory :=(127,133,139,145,151,157,163,169,175,181,187,193,199,205,211,217,223,229,235,229,223,217,211,205,199,193,187,181,175,169,163,157,151,145,139,133,127,121,115,109,103,97,91,85,79,73,67,61,55,49,43,37,31,25,19,25,31,37,43,49,55,61,67,73,79,85,91,97,103,109,115,121,127,127,127,127);

signal F4trngl : integer range 0 to 71 := 0;
type F4trngl_memory is array (0 to 71) of integer range 0 to 255;
signal F4triangle : F4trngl_memory :=(127,134,141,148,155,162,169,176,183,190,197,204,211,218,225,232,239,246,239,232,225,218,211,204,197,190,183,176,169,162,155,148,141,134,127,120,113,106,99,92,85,78,71,64,57,50,43,36,29,22,15,8,15,22,29,36,43,50,57,64,71,78,85,92,99,106,113,120,127,127,127,127);

signal G4trngl : integer range 0 to 63 := 0;
type G4trngl_memory is array (0 to 63) of integer range 0 to 255;
signal G4triangle : G4trngl_memory :=(127,135,143,151,159,167,175,183,191,199,207,215,223,231,239,247,239,231,223,215,207,199,191,183,175,167,159,151,143,135,127,119,111,103,95,87,79,71,63,55,47,39,31,23,15,7,15,23,31,39,47,55,63,71,79,87,95,103,111,119,127,127,127,127);


signal A5trngl : integer range 0 to 56 := 0;
type A5trngl_memory is array (0 to 56) of integer range 0 to 255;
signal A5triangle : A5trngl_memory :=(127,136,145,154,163,172,181,190,199,208,217,226,235,244,253,244,235,226,217,208,199,190,181,172,163,154,145,136,127,118,109,100,91,82,73,64,55,46,37,28,19,10,1,10,19,28,37,46,55,64,73,82,91,100,109,118,127);

signal B5trngl : integer range 0 to 50 := 0;
type B5trngl_memory is array (0 to 50) of integer range 0 to 255;
signal B5triangle : B5trngl_memory :=(127,137,147,157,167,177,187,197,207,217,227,237,247,237,227,217,207,197,187,177,167,157,147,137,127,117,107,97,87,77,67,57,47,37,27,17,7,17,27,37,47,57,67,77,87,97,107,117,127,127,127);

signal C5trngl : integer range 0 to 47 := 0;
type C5trngl_memory is array (0 to 47) of integer range 0 to 255;
signal C5triangle : C5trngl_memory :=(127,137,147,157,167,177,187,197,207,217,227,237,227,217,207,197,187,177,167,157,147,137,127,117,107,97,87,77,67,57,47,37,27,17,27,37,47,57,67,77,87,97,107,117,127,127,127,127);

signal D5trngl : integer range 0 to 42 := 0;
type D5trngl_memory is array (0 to 42) of integer range 0 to 255;
signal D5triangle : D5trngl_memory :=(127,139,151,163,175,187,199,211,223,235,247,235,223,211,199,187,175,163,151,139,127,115,103,91,79,67,55,43,31,19,7,19,31,43,55,67,79,91,103,115,127,127,127);


signal E5trngl : integer range 0 to 37 := 0;
type E5trngl_memory is array (0 to 37) of integer range 0 to 255;
signal E5triangle : E5trngl_memory :=(127,140,153,166,179,192,205,218,231,244,231,218,205,192,179,166,153,140,127,114,101,88,75,62,49,36,23,10,23,36,49,62,75,88,101,114,127,127);

signal F5trngl : integer range 0 to 35 := 0;
type F5trngl_memory is array (0 to 35) of integer range 0 to 255;
signal F5triangle : F5trngl_memory :=(127,141,155,169,183,197,211,225,239,225,211,197,183,169,155,141,127,113,99,85,71,57,43,29,15,29,43,57,71,85,99,113,127,127,127,127);

signal G5trngl : integer range 0 to 32 := 0;
type G5trngl_memory is array (0 to 31) of integer range 0 to 255;
signal G5triangle : G5trngl_memory :=(127,143,159,175,191,207,223,239,223,207,191,175,159,143,127,111,95,79,63,47,31,15,31,47,63,79,95,111,127,127,127,127);

signal A6trngl : integer range 0 to 28 := 0;
type A6trngl_memory is array (0 to 28) of integer range 0 to 255;
signal A6triangle : A6trngl_memory :=(127,145,163,181,199,217,235,253,235,217,199,181,163,145,127,109,91,73,55,37,19,1,19,37,55,73,91,109,127);

---------------------------------------------SAWTOOTH WAVES-----------------------------------------------------------------
signal C4sw : integer range 0 to 95 := 0;
type C4sw_memory is array (0 to 95) of integer range 0 to 255;
signal C4saw : C4sw_memory :=(0,3,5,8,11,13,16,19,22,24,27,30,32,35,38,40,43,46,49,51,54,57,59,62,65,67,70,73,75,78,81,84,86,89,92,94,97,100,102,105,108,110,113,116,119,121,124,127,129,132,135,137,140,143,146,148,151,154,156,159,162,164,167,170,172,175,178,181,183,186,189,191,194,197,199,202,205,207,210,213,216,218,221,224,226,229,232,234,237,240,243,245,248,251,253,255);

signal D4sw : integer range 0 to 84 := 0;
type D4sw_memory is array (0 to 84) of integer range 0 to 255;
signal D4saw : D4sw_memory :=(0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,147,150,153,156,159,162,165,168,171,174,177,180,183,186,189,192,195,198,201,204,207,210,214,217,220,223,226,229,232,235,238,241,244,247,250,253);

signal E4sw : integer range 0 to 75 := 0;
type E4sw_memory is array (0 to 75) of integer range 0 to 255;
signal E4saw : E4sw_memory :=(0,3,7,10,14,17,20,24,27,30,34,37,41,44,47,51,54,57,61,64,68,71,74,78,81,84,88,91,95,98,101,105,108,111,115,118,122,125,128,132,135,138,142,145,149,152,155,159,162,165,169,172,176,179,182,186,189,192,196,199,203,206,209,213,216,219,223,226,230,233,236,240,243,246,250,253);

signal F4sw : integer range 0 to 71 := 0;
type F4sw_memory is array (0 to 71) of integer range 0 to 255;
signal F4saw : F4sw_memory :=(0,4,7,11,14,18,21,25,29,32,36,39,43,46,50,54,57,61,64,68,72,75,79,82,86,89,93,97,100,104,107,111,114,118,122,125,129,132,136,139,143,147,150,154,157,161,165,168,172,175,179,182,186,190,193,197,200,204,207,211,215,218,222,225,229,232,236,240,243,247,250,254);

signal G4sw : integer range 0 to 63 := 0;
type G4sw_memory is array (0 to 63) of integer range 0 to 255;
signal G4saw : G4sw_memory :=(0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,145,149,153,157,161,165,169,173,177,181,185,189,193,197,201,205,209,213,217,221,225,229,233,237,241,245,249,253);

signal A5sw : integer range 0 to 56 := 0;
type A5sw_memory is array (0 to 56) of integer range 0 to 255;
signal A5saw : A5sw_memory :=(0,5,9,14,18,23,27,32,36,41,45,50,54,59,63,68,72,77,81,86,90,95,99,104,108,113,117,122,126,131,135,140,144,149,153,158,162,167,171,176,180,185,189,194,198,203,207,212,216,221,225,230,234,239,243,248,252);

signal B5sw : integer range 0 to 50 := 0;
type B5sw_memory is array (0 to 50) of integer range 0 to 255;
signal B5saw : B5sw_memory :=(0,5,10,15,20,25,30,35,40,46,51,56,61,66,71,76,81,86,91,96,101,106,111,116,121,126,131,137,142,147,152,157,162,167,172,177,182,187,192,197,202,207,212,217,223,228,233,238,243,248,253);

signal C5sw : integer range 0 to 47 := 0;
type C5sw_memory is array (0 to 47) of integer range 0 to 255;
signal C5saw : C5sw_memory :=(0,5,11,16,21,27,32,38,43,48,54,59,64,70,75,80,86,91,96,102,107,113,118,123,129,134,139,145,150,155,161,166,171,177,182,188,193,198,204,209,214,220,225,230,236,241,246,252);

signal D5sw : integer range 0 to 42 := 0;
type D5sw_memory is array (0 to 42) of integer range 0 to 255;
signal D5saw : D5sw_memory :=(0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,217,223,229,235,241,247,253);

signal E5sw : integer range 0 to 37 := 0;
type E5sw_memory is array (0 to 37) of integer range 0 to 255;
signal E5saw : E5sw_memory :=(0,7,14,20,27,34,41,47,54,61,68,74,81,88,95,101,108,115,122,128,135,142,149,155,162,169,176,182,189,196,203,209,216,223,230,236,243,250);

signal F5sw : integer range 0 to 35 := 0;
type F5sw_memory is array (0 to 35) of integer range 0 to 255;
signal F5saw : F5sw_memory :=(0,7,14,21,29,36,43,50,57,64,72,79,86,93,100,107,114,122,129,136,143,150,157,165,172,179,186,193,200,207,215,222,229,236,243,250);

signal G5sw : integer range 0 to 31 := 0;
type G5sw_memory is array (0 to 31) of integer range 0 to 255;
signal G5saw : G5sw_memory :=(0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,128,136,145,153,161,169,177,185,193,201,209,217,225,233,241,249);

signal A6sw : integer range 0 to 27 := 0;
type A6sw_memory is array (0 to 27) of integer range 0 to 255;
signal A6saw : A6sw_memory :=(0,9,18,27,36,45,54,63,72,81,90,99,108,117,126,135,144,153,162,171,180,189,198,207,216,225,234,243);

begin
	
process(clkDiv,en,nrst)
begin

	if nrst = '0' then
		i_data <= "000000000";
		C4sqr <= 0;
	elsif rising_edge(clkDiv) then
		if en = "01" then	
		--SQUARE
			case note is		
				when "1111111111110" =>  i_data <= std_logic_vector(to_unsigned( C4square(C4sqr),9));
												 C4sqr <= C4sqr + 1; 
												 if(C4sqr = 94) then 
												 C4sqr <= 0; 
												 end if;								 -- C4
				when "1111111111101" =>  i_data <= std_logic_vector(to_unsigned( D4square(D4sqr),9));
												 D4sqr <= D4sqr + 1; 
												 if(D4sqr = 84) then 
												 D4sqr <= 0; 
												 end if;				
				when "1111111111011" => i_data <= std_logic_vector(to_unsigned( E4square(E4sqr),9));
												 E4sqr <= E4sqr + 1; 
												 if(E4sqr = 74) then 
												 E4sqr <= 0; 
												 end if;	
				when "1111111110111" => i_data <= std_logic_vector(to_unsigned( F4square(F4sqr),9));
												 F4sqr <= F4sqr + 1; 
												 if(F4sqr = 70) then 
												 F4sqr <= 0; 
												 end if;	
				when "1111111101111" => i_data <= std_logic_vector(to_unsigned( G4square(G4sqr),9));
												 G4sqr <= G4sqr + 1; 
												 if(G4sqr = 62) then 
												 G4sqr <= 0; 
												 end if;	
				when "1111111011111" => i_data <= std_logic_vector(to_unsigned( A5square(A5sqr),9));
												 A5sqr <= A5sqr + 1; 
												 if(A5sqr = 55) then 
												 A5sqr <= 0; 
												 end if;	
				when "1111110111111" => i_data <= std_logic_vector(to_unsigned( B5square(B5sqr),9));
												 B5sqr <= B5sqr + 1; 
												 if(B5sqr = 49) then 
												 B5sqr <= 0; 
												 end if;	
				when "1111101111111" => i_data <= std_logic_vector(to_unsigned( C5square(C5sqr),9));
												 C5sqr <= C5sqr + 1; 
												 if(C5sqr = 46) then 
												 C5sqr <= 0; 
												 end if;	
				when "1111011111111" => i_data <= std_logic_vector(to_unsigned( D5square(D5sqr),9));
												 D5sqr <= D5sqr + 1; 
												 if(D5sqr = 41) then 
												 D5sqr <= 0; 
												 end if;	
				when "1110111111111" => i_data <= std_logic_vector(to_unsigned( E4square(E4sqr),9));
												 E4sqr <= E4sqr + 1; 
												 if(E4sqr = 36) then 
												 E4sqr <= 0; 
												 end if;	
				when "1101111111111" => i_data <= std_logic_vector(to_unsigned( F5square(F5sqr),9));
												 F5sqr <= F5sqr + 1; 
												 if(F5sqr = 34) then 
												 F5sqr <= 0; 
												 end if;	
				when "1011111111111" => i_data <= std_logic_vector(to_unsigned( G5square(G5sqr),9));
												 G5sqr <= G5sqr + 1; 
												 if(G5sqr = 30) then 
												 G5sqr <= 0; 
												 end if;	
				when "0111111111111" => i_data <= std_logic_vector(to_unsigned( A6square(A6sqr),9));
												 A6sqr <= A6sqr + 1; 
												 if(A6sqr = 27) then 
												 A6sqr <= 0; 
												 end if;	
				when others =>	i_data <= "000000000";--max_count := 0;	 -- no squarewave
			end case;
		elsif en = "10" then
		--SINE
			case note is		
				when "1111111111110" =>  i_data <= std_logic_vector(to_unsigned( C4sine(C4sn),9));
												 C4sn <= C4sn + 1; 
												 if(C4sn = 94) then 
												 C4sn <= 0; 
												 end if;								 -- C4
				when "1111111111101" => i_data <= std_logic_vector(to_unsigned( D4sine(D4sn),9));
												 D4sn <= D4sn + 1; 
												 if(D4sn = 83) then 
												 D4sn <= 0; 
												 end if;
				when "1111111111011" => i_data <= std_logic_vector(to_unsigned( E4sine(E4sn),9));
												 E4sn <= E4sn + 1; 
												 if(E4sn = 74) then 
												 E4sn <= 0; 
												 end if;
				when "1111111110111" => i_data <= std_logic_vector(to_unsigned( F4sine(F4sn),9));
												 F4sn <= F4sn + 1; 
												 if(F4sn = 70) then 
												 F4sn <= 0; 
												 end if;
				when "1111111101111" => i_data <= std_logic_vector(to_unsigned( G4sine(G4sn),9));
												 G4sn <= G4sn + 1; 
												 if(G4sn = 62) then 
												 G4sn <= 0; 
												 end if;
				when "1111111011111" => i_data <= std_logic_vector(to_unsigned( A5sine(A5sn),9));
												 A5sn <= A5sn + 1; 
												 if(A5sn = 55) then 
												 A5sn <= 0; 
												 end if;
				when "1111110111111" => i_data <= std_logic_vector(to_unsigned( B5sine(B5sn),9));
												 B5sn <= B5sn + 1; 
												 if(B5sn = 49) then 
												 B5sn <= 0; 
												 end if;
				when "1111101111111" => i_data <= std_logic_vector(to_unsigned( C5sine(C5sn),9));
												 C5sn <= C5sn + 1; 
												 if(C5sn = 46) then 
												 C5sn <= 0; 
												 end if;
				when "1111011111111" => i_data <= std_logic_vector(to_unsigned( D5sine(D5sn),9));
												 D5sn <= D5sn + 1; 
												 if(D5sn = 41) then 
												 D5sn <= 0; 
												 end if;
				when "1110111111111" => i_data <= std_logic_vector(to_unsigned( E5sine(E5sn),9));
												 E5sn <= E5sn + 1; 
												 if(E5sn = 36) then 
												 E5sn <= 0; 
												 end if;
				when "1101111111111" => i_data <= std_logic_vector(to_unsigned( F5sine(F5sn),9));
												 F5sn <= F5sn + 1; 
												 if(F5sn = 34) then 
												 F5sn <= 0; 
												 end if;
				when "1011111111111" => i_data <= std_logic_vector(to_unsigned( G5sine(G5sn),9));
												 G5sn <= G5sn + 1; 
												 if(G5sn = 31) then 
												 G5sn <= 0; 
												 end if;
				when "0111111111111" => i_data <= std_logic_vector(to_unsigned( A6sine(A6sn),9));
												 A6sn <= A6sn + 1; 
												 if(A6sn = 27) then 
												 A6sn <= 0; 
												 end if;
				when others =>	i_data <= "000000000";--max_count := 0;	 -- no sinewave
			end case;
		elsif en = "11" then
		--TRIANGLE
			case note is		
				when "1111111111110" =>  i_data <= std_logic_vector(to_unsigned( C4triangle(C4trngl),9));
												 C4trngl <= C4trngl + 1; 
												 if(C4trngl = 94) then 
												 C4trngl <= 0; 
												 end if;								 -- C4
				when "1111111111101" => i_data <= std_logic_vector(to_unsigned( D4triangle(D4trngl),9));
												 D4trngl <= D4trngl + 1; 
												 if(D4trngl = 83) then 
												 D4trngl <= 0; 
												 end if;
				when "1111111111011" => i_data <= std_logic_vector(to_unsigned( E4triangle(E4trngl),9));
												 E4trngl <= E4trngl + 1; 
												 if(E4trngl = 74) then 
												 E4trngl <= 0; 
												 end if;
				when "1111111110111" => i_data <= std_logic_vector(to_unsigned( F4triangle(F4trngl),9));
												 F4trngl <= F4trngl + 1; 
												 if(F4trngl = 70) then 
												 F4trngl <= 0; 
												 end if;
				when "1111111101111" => i_data <= std_logic_vector(to_unsigned( G4triangle(G4trngl),9));
												 G4trngl <= G4trngl + 1; 
												 if(G4trngl = 62) then 
												 G4trngl <= 0; 
												 end if;
				when "1111111011111" => i_data <= std_logic_vector(to_unsigned( A5triangle(A5trngl),9));
												 A5trngl <= A5trngl + 1; 
												 if(A5trngl = 55) then 
												 A5trngl <= 0; 
												 end if;
				when "1111110111111" => i_data <= std_logic_vector(to_unsigned( B5triangle(B5trngl),9));
												 B5trngl <= B5trngl + 1; 
												 if(B5trngl = 49) then 
												 B5trngl <= 0; 
												 end if;
				when "1111101111111" => i_data <= std_logic_vector(to_unsigned( C5triangle(C5trngl),9));
												 C5trngl <= C5trngl + 1; 
												 if(C5trngl = 46) then 
												 C5trngl <= 0; 
												 end if;
				when "1111011111111" => i_data <= std_logic_vector(to_unsigned( D5triangle(D5trngl),9));
												 D5trngl <= D5trngl + 1; 
												 if(D5trngl = 41) then 
												 D5trngl <= 0; 
												 end if;
				when "1110111111111" => i_data <= std_logic_vector(to_unsigned( E5triangle(E5trngl),9));
												 E5trngl <= E5trngl + 1; 
												 if(E5trngl = 36) then 
												 E5trngl <= 0; 
												 end if;
				when "1101111111111" => i_data <= std_logic_vector(to_unsigned( F5triangle(F5trngl),9));
												 F5trngl <= F5trngl + 1; 
												 if(F5trngl = 34) then 
												 F5trngl <= 0; 
												 end if;
				when "1011111111111" => i_data <= std_logic_vector(to_unsigned( G5triangle(G5trngl),9));
												 G5trngl <= G5trngl + 1; 
												 if(G5trngl = 31) then 
												 G5trngl <= 0; 
												 end if;
				when "0111111111111" => i_data <= std_logic_vector(to_unsigned( A6triangle(A6trngl),9));
												 A6trngl <= A6trngl + 1; 
												 if(A6trngl = 27) then 
												 A6trngl <= 0; 
												 end if;
				when others =>	i_data <= "000000000";--max_count := 0;	 -- no squarewave
			end case;
		else 	
		--SAW
			case note is		
				when "1111111111110" =>  i_data <= std_logic_vector(to_unsigned( C4saw(C4sw),9));
												 C4sw <= C4sw + 1; 
												 if(C4sw = 94) then 
												 C4sw <= 0; 
												 end if;								 -- C4
				when "1111111111101" => i_data <= std_logic_vector(to_unsigned( D4saw(D4sw),9));
												 D4sw <= D4sw + 1; 
												 if(D4sw = 83) then 
												 D4sw <= 0; 
												 end if;
				when "1111111111011" => i_data <= std_logic_vector(to_unsigned( E4saw(E4sw),9));
												 E4sw <= E4sw + 1; 
												 if(E4sw = 74) then 
												 E4sw <= 0; 
												 end if;
				when "1111111110111" => i_data <= std_logic_vector(to_unsigned( F4saw(F4sw),9));
												 F4sw <= F4sw + 1; 
												 if(F4sw = 70) then 
												 F4sw <= 0; 
												 end if;
				when "1111111101111" => i_data <= std_logic_vector(to_unsigned( G4saw(G4sw),9));
												 G4sw <= G4sw + 1; 
												 if(G4sw = 62) then 
												 G4sw <= 0; 
												 end if;
				when "1111111011111" => i_data <= std_logic_vector(to_unsigned( A5saw(A5sw),9));
												 A5sw <= A5sw + 1; 
												 if(A5sw = 55) then 
												 A5sw <= 0; 
												 end if;
				when "1111110111111" => i_data <= std_logic_vector(to_unsigned( B5saw(B5sw),9));
												 B5sw <= B5sw + 1; 
												 if(B5sw = 49) then 
												 B5sw <= 0; 
												 end if;
				when "1111101111111" => i_data <= std_logic_vector(to_unsigned( C5saw(C5sw),9));
												 C5sw <= C5sw + 1; 
												 if(C5sw = 46) then 
												 C5sw <= 0; 
												 end if;
				when "1111011111111" => i_data <= std_logic_vector(to_unsigned( D5saw(D5sw),9));
												 D5sw <= D5sw + 1; 
												 if(D5sw = 41) then 
												 D5sw <= 0; 
												 end if;
				when "1110111111111" => i_data <= std_logic_vector(to_unsigned( E5saw(E5sw),9));
												 E5sw <= E5sw + 1; 
												 if(E5sw = 36) then 
												 E5sw <= 0; 
												 end if;
				when "1101111111111" => i_data <= std_logic_vector(to_unsigned( F5saw(F5sw),9));
												 F5sw <= F5sw + 1; 
												 if(F5sw = 34) then 
												 F5sw <= 0; 
												 end if;
				when "1011111111111" => i_data <= std_logic_vector(to_unsigned( G5saw(G5sw),9));
												 G5sw <= G5sw + 1; 
												 if(G5sw = 30) then 
												 G5sw <= 0; 
												 end if;
				when "0111111111111" => i_data <= std_logic_vector(to_unsigned( A6saw(A6sw),9));
												 A6sw <= A6sw + 1; 
												 if(A6sw = 26) then 
												 A6sw <= 0; 
												 end if;
				when others =>	i_data <= "000000000";--max_count := 0;	 -- no squarewave
			end case;
		end if;	
	end if;	
		
end process;
end Behavioral;