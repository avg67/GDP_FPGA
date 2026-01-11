# GDP-FPGA v1 for Lattice XP FPGA

Lattice Diamond Workspace: GDP936X\syn\Lattice\GDP.ldf

Anschluss SD-Karte an GDP-FPGA: https://nkcforum.de/ndr/hardware/neu/mspeicher/sdalt/index.html

## FPGA-Files:
- GDP_FPGA_ext_DIP_everything.jed
   - GDP_FPGA mit allen Peripherals (GDP, KEY, MOUSE, SER1, SOUND, SPI, TIMER, GPIO) und 
     externen DIP-Switches an folgenden PINS:
      Dip switch	FPGA-PIN	EXT
      dipswitches(0)	"134"	EXT25
      dipswitches(1)	"135"	EXT24
      dipswitches(2)	"137"	EXT23
      dipswitches(3)	"138"	EXT22
      dipswitches(4)	"139"	EXT21
      dipswitches(5)	"140"	EXT20
      dipswitches(6)	"141"	EXT19
      dipswitches(7)	"4"	EXT18
     
     GPIO:
      -  Data-Register IO-Addresse:  0x04
      -  Data-Direction IO-Addresse: 0x05 (bit = 0 -> Eingabe; 1 -> Ausgabe)

