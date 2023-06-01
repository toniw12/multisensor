################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/hid/usbd_hid_composite.c \
/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/hid/usbd_hid_composite_if.c 

C_DEPS += \
./core/core/stm32/usb/hid/usbd_hid_composite.c.d \
./core/core/stm32/usb/hid/usbd_hid_composite_if.c.d 

AR_OBJ += \
./core/core/stm32/usb/hid/usbd_hid_composite.c.o \
./core/core/stm32/usb/hid/usbd_hid_composite_if.c.o 


# Each subdirectory must supply rules for building sources it contributes
core/core/stm32/usb/hid/usbd_hid_composite.c.o: /home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/hid/usbd_hid_composite.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/xpack-arm-none-eabi-gcc/10.3.1-2.3/bin/arm-none-eabi-gcc" -mcpu=cortex-m0plus   -DUSE_FULL_LL_DRIVER -mthumb "@/home/antoine/eclipse-workspace/multisensor/Release/sketch/build.opt" -c -Og -g -DNDEBUG -w -std=gnu11 -ffunction-sections -fdata-sections --param max-inline-insns-single=500 -MMD "-I/home/antoine/eclipse-workspace/multisensor" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/avr" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/LL" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/OpenAMP" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/hid" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/cdc" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/STM32G0xx_HAL_Driver/Inc" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/STM32G0xx_HAL_Driver/Src" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/STM32G0xx" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/ST/STM32_USB_Device_Library/Core/Src" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP/open-amp/lib/include" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP/libmetal/lib/include" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP/virtual_driver" -DSTM32G0xx -DARDUINO=10812 -DARDUINO_GENERIC_G070KBTX -DARDUINO_ARCH_STM32 "-DBOARD_NAME=\"GENERIC_G070KBTX\"" "-DVARIANT_H=\"variant_generic.h\""   -DSTM32G070xx  -DHAL_UART_MODULE_ENABLED -D__CORTEX_SC=0  "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/CMSIS/5.7.0/CMSIS/Core/Include/" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/CMSIS/Device/ST/STM32G0xx/Include/" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/CMSIS/Device/ST/STM32G0xx/Source/Templates/gcc/" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/CMSIS/5.7.0/CMSIS/DSP/Include" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/CMSIS/5.7.0/CMSIS/DSP/PrivateInclude"   -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/variants/STM32G0xx/G070KBT" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino" -I"/home/antoine/Arduino/libraries/ArduinoModbus/src" -I"/home/antoine/Arduino/libraries/ArduinoRS485/src" -I"/home/antoine/Arduino/libraries/Adafruit_BMP280_Library" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/libraries/SrcWrapper/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/libraries/Wire/src" -I"/home/antoine/Arduino/libraries/base64/src" -I"/home/antoine/Arduino/libraries/Time" -I"/home/antoine/Arduino/libraries/Adafruit_Unified_Sensor" -I"/home/antoine/Arduino/libraries/FileLogger/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/I2C_EEPROM/1.7.1" -I"/home/antoine/Arduino/libraries/LinkedList" -I"/home/antoine/Arduino/libraries/Adafruit_GFX_Library" -I"/home/antoine/Arduino/libraries/Adafruit_SSD1306" -I"/home/antoine/Arduino/libraries/SdFat/src" -I"/home/antoine/Arduino/libraries/Adafruit_BusIO" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/Sensirion_I2C_SCD4x/0.4.0/src" -I"/home/antoine/Arduino/libraries/BMx280MI/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/DS3232RTC/2.0.1/src" -I"/home/antoine/Arduino/libraries/ArduinoJson/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/libraries/SPI/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/Sensirion_Core/0.6.0/src" -I"/home/antoine/Arduino/libraries/cinterSensor/src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 "$<"   -o "$@"
	@echo 'Finished building: $<'
	@echo ' '

core/core/stm32/usb/hid/usbd_hid_composite_if.c.o: /home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/hid/usbd_hid_composite_if.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/xpack-arm-none-eabi-gcc/10.3.1-2.3/bin/arm-none-eabi-gcc" -mcpu=cortex-m0plus   -DUSE_FULL_LL_DRIVER -mthumb "@/home/antoine/eclipse-workspace/multisensor/Release/sketch/build.opt" -c -Og -g -DNDEBUG -w -std=gnu11 -ffunction-sections -fdata-sections --param max-inline-insns-single=500 -MMD "-I/home/antoine/eclipse-workspace/multisensor" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/avr" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/LL" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/OpenAMP" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/hid" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino/stm32/usb/cdc" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/STM32G0xx_HAL_Driver/Inc" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/STM32G0xx_HAL_Driver/Src" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/STM32G0xx" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/ST/STM32_USB_Device_Library/Core/Src" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP/open-amp/lib/include" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP/libmetal/lib/include" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Middlewares/OpenAMP/virtual_driver" -DSTM32G0xx -DARDUINO=10812 -DARDUINO_GENERIC_G070KBTX -DARDUINO_ARCH_STM32 "-DBOARD_NAME=\"GENERIC_G070KBTX\"" "-DVARIANT_H=\"variant_generic.h\""   -DSTM32G070xx  -DHAL_UART_MODULE_ENABLED -D__CORTEX_SC=0  "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/CMSIS/5.7.0/CMSIS/Core/Include/" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/CMSIS/Device/ST/STM32G0xx/Include/" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/system/Drivers/CMSIS/Device/ST/STM32G0xx/Source/Templates/gcc/" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/CMSIS/5.7.0/CMSIS/DSP/Include" "-I/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/tools/CMSIS/5.7.0/CMSIS/DSP/PrivateInclude"   -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/variants/STM32G0xx/G070KBT" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/cores/arduino" -I"/home/antoine/Arduino/libraries/ArduinoModbus/src" -I"/home/antoine/Arduino/libraries/ArduinoRS485/src" -I"/home/antoine/Arduino/libraries/Adafruit_BMP280_Library" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/libraries/SrcWrapper/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/libraries/Wire/src" -I"/home/antoine/Arduino/libraries/base64/src" -I"/home/antoine/Arduino/libraries/Time" -I"/home/antoine/Arduino/libraries/Adafruit_Unified_Sensor" -I"/home/antoine/Arduino/libraries/FileLogger/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/I2C_EEPROM/1.7.1" -I"/home/antoine/Arduino/libraries/LinkedList" -I"/home/antoine/Arduino/libraries/Adafruit_GFX_Library" -I"/home/antoine/Arduino/libraries/Adafruit_SSD1306" -I"/home/antoine/Arduino/libraries/SdFat/src" -I"/home/antoine/Arduino/libraries/Adafruit_BusIO" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/Sensirion_I2C_SCD4x/0.4.0/src" -I"/home/antoine/Arduino/libraries/BMx280MI/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/DS3232RTC/2.0.1/src" -I"/home/antoine/Arduino/libraries/ArduinoJson/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/packages/STMicroelectronics/hardware/stm32/2.4.0/libraries/SPI/src" -I"/home/antoine/eclipse/cpp-2022-09/eclipse/arduinoPlugin/libraries/Sensirion_Core/0.6.0/src" -I"/home/antoine/Arduino/libraries/cinterSensor/src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 "$<"   -o "$@"
	@echo 'Finished building: $<'
	@echo ' '


