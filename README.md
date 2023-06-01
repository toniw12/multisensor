# multisensor

## Block diagramm

## Sensors
Sensors directly on the PCB
1. [MIX8410 Electrochemical Oxygen Gas Sensor](https://wiki.seeedstudio.com/Grove-Gas_Sensor-O2-MIX8410/)
1. [Telaire T6615 CO2 Sensor](https://www.amphenol-sensors.com/en/telaire/co2/525-co2-sensor-modules/319-t6615)
1. [BME280 Combined humidity and pressure sensor](https://www.bosch-sensortec.com/products/environmental-sensors/humidity-sensors-bme280/)

Aditional sensors connected via the Seeed connecter
1. [Sensirion SCD41 CO2 sensor](https://sensirion.com/products/catalog/SCD41/)
1. [Optical Oxygen Gas Sensor - FDO2](https://www.pyroscience.com/en/products/all-meters/fdo2)
1. [Sensortech CH4/CO2 INIR sensor](https://www.mouser.com/catalog/specsheets/Amphenol_11212018_DS-0229%20(INIR%20Datasheet)%20V8%20October%202018.pdf)


## Modbus registers

| Register          | Data type          | Parameter              | factor | unit     |
| ----------------- | ------------------ | ---------------------- | ------ | -------- |
| 0x00              | uint16, read-only  | input voltage          | 0.001  | V        |
| 0x01              | uint16, read-only  | oxygen                 | 0.001  | %        |
| 0x02              | uint16, read-only  | Temperature            | 0.01   | °C       |
| 0x03              | uint16, read-only  | Humidity               | 0.01   | %        |
| 0x04              | uint16, read-only  | Pressure MSB           | 65536  | Pa       |
| 0x05              | uint16, read-only  | Pressure LSB           | 1      | Pa       |
| 0x06              | uint16, read-only  | CO2                    | 1      | ppm      |
| \>0x06            | uint16, read-only  | other registers        |        |          |
|                   |                    |                        |        |          |
| Coils             |                    |                        |        |          |
| 0x00              | 1 bit, read/write  | motor / heating output | \-     | on / off |
|                   |                    |                        |        |          |
| Holding Registers |                    |                        |        |          |
| Register          |                    | Parameter              |        |          |
| 0x00              | uint16, write-only | Modbus slave address   |        |          |