# GDP-FPGA v1 for Lattice XP FPGA

Lattice Diamond Workspace: GDP936X\syn\Lattice\GDP.ldf

Anschluss SD-Karte an GDP-FPGA: https://nkcforum.de/ndr/hardware/neu/mspeicher/sdalt/index.html

## FPGA-Files:
- GDP_FPGA_ext_DIP_everything.jed
   - GDP_FPGA mit allen Peripherals (GDP, KEY, MOUSE, SER1, SOUND, SPI, TIMER, GPIO) und 
     externen DIP-Switches für 68k
- GDP_FPGA_ext_DIP_everything_SDIO.jed
   - GDP_FPGA mit allen Peripherals (GDP, KEY, MOUSE, SER1, SOUND, SDIO, TIMER, GPIO) und 
     externen DIP-Switches für Z80

  Pins:
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
        |GPIO(7)|"15" | EXT10|
        |GPIO(6)|"13" | EXT11|
        |GPIO(5)|"12" | EXT12|
        |GPIO(4)|"10" | EXT13|
        
        |GPIO(3)|"9"  | EXT14|
        |GPIO(2)|"7"  | EXT15|
        |GPIO(2)|"6"  | EXT16|
        |GPIO(0)|"5"  | EXT17|
      
      -  Data-Register IO-Addresse:  0x04
      -  Data-Direction IO-Addresse: 0x05 (bit = 0 -> Eingabe; 1 -> Ausgabe)
        
      SPI / SDIO:
      - PINS:
        |Pin|FPGA-PIN|EXT|
        |----------|--------|---|
        |SD_SCK |"12" | EXT2|
        |SD_MOSI|"25" | EXT4|
        |SD_MISO|"30" | EXT0|
        |SD_nCS(0)|"22" | EXT6|
        |SD_nCS(1)|"23" | EXT5|
        |SD_pwr_on|"29" | EXT1|
        
        SD_pwr_on ist mit bit3 vom Control-register verbunden (bit = 1 -> Spannung für SD-Cards einschalten; 0 -> Aus)
        Nur beim SDIO vorhanden, beim 68k-SPI ist es auerhaft auf 0!
        
        
 Schaltplan: https://github.com/avg67/GDP_FPGA/blob/main/schaltplan.pdf
