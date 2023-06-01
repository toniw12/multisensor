// Do not remove the include below
#include "multisensor.h"

#include <ArduinoRS485.h> // ArduinoModbus depends on the ArduinoRS485 library
#include <ArduinoModbus.h>
#include <Wire.h>

#include <Adafruit_BMP280.h>
#include "ADCfilteredReader.h"
#include "bmx280Reader.h"
#include "scd41Reader.h"
#include <ValueFilter.h>

//#define OPTICAL_O2
#define METHANE



#ifdef OPTICAL_O2
HardwareSerial oxygen(PB9, PB2); //USART3
#else
#ifdef METHANE
HardwareSerial methane(PB9, PB2); //USART3
#else
HardwareSerial debug(PB9, PB2); //USART3
#endif
#endif
HardwareSerial rs485_uart(PA3, PA2); //USART2
RS485Class rs485(rs485_uart, PA2,PA4,-1);

HardwareSerial co2(PA10, PA9); //USART1
//#define co2 debug

//#define MOTOR_EN PB5
#define MOTOR_EN PA6

int noDataCnt=0;
uint32_t modbusAddress;

#define FlashPageAddress 0x0801F800

uint32_t millisCO2read=0;

TwoWire i2c = TwoWire(PB7,PB6);
ADCfilteredReader vsense(PB1,8.887031,500);
ADCfilteredReader o2sense(PA5,7.4336,500);

ValueFilter temperatureFilter(1,500);
ValueFilter humidityFilter(1,500);
ValueFilter32 pressureFilter(1,500);
ValueFilter co2filter(1,32);


#ifdef OPTICAL_O2
ValueFilter32 o2filter(1,32);
ValueFilter32 o2filterTemp(1,32);
ValueFilter32 o2filterPressure(1,32);
ValueFilter32 o2filterHumidity(1,32);
#endif

#ifdef METHANE
int methaneStatus=0;
int32_t methaneValues[8]={0x7FFFFFFF};
#endif

BMx280Reader bmx280(&i2c);
//SCD41Reader scd41(&i2c);

uint32_t Flash_Write_Data (int newAddress)
{
   /* Unlock the Flash to enable the flash control register access *************/
  HAL_FLASH_Unlock();
  FLASH_EraseInitTypeDef FLASH_EraseInitStruct = {0};
  FLASH_EraseInitStruct.TypeErase = FLASH_TYPEERASE_PAGES;
  FLASH_EraseInitStruct.Page = 63;
  FLASH_EraseInitStruct.NbPages = 1;
  uint32_t  errorStatus = 0;
  HAL_FLASHEx_Erase(&FLASH_EraseInitStruct,&errorStatus);
  uint64_t FData = newAddress;
  HAL_FLASH_Program(FLASH_TYPEPROGRAM_DOUBLEWORD,FlashPageAddress, FData);
  HAL_FLASH_Lock();

  return 0;
}

extern "C" void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSIDiv = RCC_HSI_DIV4;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}


void setup() {
  rs485_uart.begin(9600);
  //
#ifdef OPTICAL_O2
  oxygen.begin(19200);
#else
#ifdef METHANE
  methane.begin(9600);
#else
  debug.begin(9600);
#endif
#endif
  co2.begin(19200);

  pinMode(PA4, OUTPUT);
  digitalWrite(PA4, SET);

  co2.write(' ');// setup IT callback ???

  i2c.begin();

  vsense.begin();
  o2sense.begin();
  bmx280.begin();
  //scd41.begin();

  uint32_t * RDAddr = (uint32_t *)  FlashPageAddress;
  modbusAddress = *RDAddr;

  //debug.print("modbusAddress:");
  //debug.println(modbusAddress);

  if(modbusAddress>254 || modbusAddress<1){
    //debug.println("modbus address out of range, set to address 1");
    modbusAddress =1;
  }

  if (!ModbusRTUServer.begin(rs485,(int)modbusAddress, 9600)) {
    //debug.println("Failed to start Modbus RTU Server!");
    while (1);
  }
  ModbusRTUServer.configureInputRegisters(0x00, 40);
  ModbusRTUServer.configureHoldingRegisters(0x00, 1);
  ModbusRTUServer.configureCoils(0, 1);


 pinMode(MOTOR_EN, OUTPUT);
 digitalWrite(MOTOR_EN, RESET);
#ifdef METHANE
 methane.print("[B]\n\r");
#endif

}

void loop() {
  ModbusRTUServer.poll();
  // put your main code here, to run repeatedly:

  digitalWrite(MOTOR_EN, ModbusRTUServer.coilRead(0));
  bmx280.measure();

  if(co2.available()>=5){
    char buf[5];
    co2.readBytes(buf, 5);
    co2filter.filter((buf[3]<<8)+buf[4]);
    noDataCnt=2;
  }
  else{
    if(noDataCnt==0){
        co2filter.filter(0x7FFF);
    }
  }
  uint32_t currentMillis=getCurrentMillis();
  if (currentMillis>millisCO2read+1000){
      if(noDataCnt>0){
        noDataCnt--;
      }

      //clear SERIAL input Buffer
      while(co2.available()){
        co2.read();
      }

      // read GAS PPM: FF FE 02 02 03
      byte message[] = {0xFF, 0xFE, 0x02, 0x02, 0x03};
      co2.write(message, sizeof(message));
      millisCO2read=currentMillis;
  }


  //scd41.measure();

  //ModbusRTUServer.inputRegisterWrite(7, scd41.registers[SCD41_TEMPERATURE]);
  //ModbusRTUServer.inputRegisterWrite(8, scd41.registers[SCD41_HUMIDITY]);
  //ModbusRTUServer.inputRegisterWrite(9, scd41.registers[SCD41_CO2]);

  int newAddress=ModbusRTUServer.holdingRegisterRead(0);
  if(newAddress!=0&&modbusAddress!=newAddress){
      ModbusRTUServer.holdingRegisterWrite(0, 0);
      //debug.print("Programm new Address:");
      //debug.println(newAddress);
      delay(100);
      Flash_Write_Data(newAddress);
      delay(100);
      //debug.println("Write Flash done");

      HAL_NVIC_SystemReset();
  }
#ifdef OPTICAL_O2
  uint32_t o2vals[8];
  if(oxygen.available()>5){
      while(oxygen.available()){
          if(oxygen.read()=='#'){
              break;
          }
      }
      //oxygen.println("Found Start");
      char buffer[20];
      oxygen.readBytes(buffer, 4);
      if(memcmp(buffer,"MRAW",4)==0){
          //Serial.println("Found MRAW");

          for(int i=0;i<8;i++){
              uint32_t val=oxygen.parseInt(SKIP_WHITESPACE);
              o2vals [i]=val;

              ModbusRTUServer.inputRegisterWrite(i*2+27,val>>16);
              ModbusRTUServer.inputRegisterWrite(i*2+28,val&0xFFFF);
          }
          o2filter.filter(o2vals[0]);
          ModbusRTUServer.inputRegisterWrite(7, o2filter.highReg());
          ModbusRTUServer.inputRegisterWrite(8, o2filter.lowReg());
          o2filterTemp.filter(o2vals[1]);
          ModbusRTUServer.inputRegisterWrite(9, o2filterTemp.highReg());
          ModbusRTUServer.inputRegisterWrite(10, o2filterTemp.lowReg());
          o2filterPressure.filter(o2vals[6]);
          ModbusRTUServer.inputRegisterWrite(11, o2filterPressure.highReg());
          ModbusRTUServer.inputRegisterWrite(12, o2filterPressure.lowReg());
          o2filterHumidity.filter(o2vals[7]);
          ModbusRTUServer.inputRegisterWrite(13, o2filterHumidity.highReg());
          ModbusRTUServer.inputRegisterWrite(14, o2filterHumidity.lowReg());
      }
  }
#else
#ifdef METHANE
  char inputLine[10];
  while(methane.available()>=10){
      volatile int retRead=methane.readBytes(inputLine, 10);
      if(methaneStatus==0){
          if(strncmp(inputLine,"0000005b\n\r",10)==0){
              methaneStatus=1;
          }
          else{
              // flush all input bytes
              while(methane.available()){
                  methane.read();
              }
          }
      }
      else if(methaneStatus<8){
          if(inputLine[8]=='\n'&&inputLine[9]=='\r'){
              char * end;
              int32_t value=strtoll(inputLine,&end,16);
              if(end-inputLine==8){ // all 8 characters are converted
                  methaneValues[methaneStatus-1]=value;
                  methaneStatus++;
              }
              else{
                  methaneStatus=0;
                  delay(20);
                  while(methane.available()){
                      methane.read();
                  }
              }
          }
          else{
              methaneStatus=0;
              delay(20);
              while(methane.available()){
                  methane.read();
              }
          }
      }
      else{
          if(strncmp(inputLine,"0000005d\n\r",10)==0){

              ModbusRTUServer.inputRegisterWrite(7, (uint16_t)((int32_t)methaneValues[0]&0xffff));
              ModbusRTUServer.inputRegisterWrite(8, (uint16_t)((int32_t)methaneValues[2]&0xffff));
              ModbusRTUServer.inputRegisterWrite(9, (uint16_t)((int32_t)methaneValues[3]&0xffff));
              ModbusRTUServer.inputRegisterWrite(10, (uint16_t)((int32_t)methaneValues[4]&0xffff));
          }
          else{
              methane.print("[B]\n\r");
          }
          methaneStatus=0;
      }
  }
#endif
#endif

  ModbusRTUServer.inputRegisterWrite(0, vsense.measure());
  ModbusRTUServer.inputRegisterWrite(1, o2sense.measure());
  ModbusRTUServer.inputRegisterWrite(2, temperatureFilter.filter(bmx280.registers[BMx280_TEMPERATURE]));
  pressureFilter.filter(bmx280.pressure);
  ModbusRTUServer.inputRegisterWrite(3, pressureFilter.highReg());
  ModbusRTUServer.inputRegisterWrite(4, pressureFilter.lowReg());
  ModbusRTUServer.inputRegisterWrite(5, humidityFilter.filter(bmx280.registers[BMx280_HUMIDITY]));
  ModbusRTUServer.inputRegisterWrite(6, co2filter.value);


  ModbusRTUServer.inputRegisterWrite(20, vsense.getLastRawValue());
  ModbusRTUServer.inputRegisterWrite(21, o2sense.getLastRawValue());

  ModbusRTUServer.inputRegisterWrite(22, bmx280.registers[BMx280_TEMPERATURE]);
  ModbusRTUServer.inputRegisterWrite(23, bmx280.registers[BMx280_PRESSURE_MSB]);
  ModbusRTUServer.inputRegisterWrite(24, bmx280.registers[BMx280_PRESSURE_LSB]);
  ModbusRTUServer.inputRegisterWrite(25, bmx280.registers[BMx280_HUMIDITY]);
  ModbusRTUServer.inputRegisterWrite(26, co2filter.rawValue);


}
