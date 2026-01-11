# GDP-FPGA v1 for Lattice XP FPGA

Lattice Diamond Workspace: GDP936X\syn\Lattice\GDP.ldf

Anschluss SD-Karte an GDP-FPGA: https://nkcforum.de/ndr/hardware/neu/mspeicher/sdalt/index.html

## FPGA-Files:
- GDP_FPGA_ext_DIP_everything.jed
   - GDP_FPGA mit allen Peripherals (GDP, KEY, MOUSE, SER1, SOUND, SPI, TIMER, GPIO) und 
     externen DIP-Switches an folgenden PINS:
      |Dip switch|FPGA-PIN|EXT|
      |----------|--------|---|
      |dipswitches(0)|"134" | EXT25|
      |dipswitches(1)|"135" | EXT24|
      |dipswitches(2)|"137" | EXT23|
      |dipswitches(3)|"138" | EXT22|
      |dipswitches(4)|"139" | EXT21|
      |dipswitches(5)|"140" | EXT20|
      |dipswitches(6)|"141" | EXT19|
      |dipswitches(7)|"4"   | EXT18|
     
     GPIO:
      - PINS:
        |Pin|FPGA-PIN|EXT|
        |----------|--------|---|
        |GPIO(0)|"15" | EXT10|
        |GPIO(1)|"13" | EXT11|
        |GPIO(2)|"12" | EXT12|
        |GPIO(3)|"10" | EXT13|
        |GPIO(4)|"9"  | EXT14|
        |GPIO(5)|"7"  | EXT15|
        |GPIO(6)|"6"  | EXT16|
        |GPIO(7)|"5"  | EXT17|
      
      -  Data-Register IO-Addresse:  0x04
      -  Data-Direction IO-Addresse: 0x05 (bit = 0 -> Eingabe; 1 -> Ausgabe)
 
 Schaltplan: https://github.com/avg67/GDP_FPGA/blob/main/schaltplan.pdf
