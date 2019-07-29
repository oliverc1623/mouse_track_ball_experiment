# Mouse Track Ball Experiment

## Table of Contents
* [Getting Started](#getting-started)  
  * [Hardware Prerequisites](#hardware-prerequisites)  
  * [Making the scale box](#making-the-scale-box)
  * [Software Prerequisites](#software-prerequisites)
* [Load cell to Arduino hookup guide](#load-cell-to-arduino-hookup-guide)
* [Installation](#installation)
* [Arduino code](#arduino-code)
* [Matlab code](#matlab-code)
  * [System_scale](#system-scale)
  * [Run scale](#run-scale)

## Getting Started
### Hardware Prerequisites
* 2x Arduino Due
* 1x Teensy board (if you want servo moving object)
* 1x Servo Motor (SG-5010)
* 2x Basler Cameras
* 1x IR emitter 
* 2x ADNS-9800 laser sensor

### Equipment Setup
For the Arduinoe Dues and ADNS laser sensors, we will use the 3.3v configuration.

#### I/O
Laser Sensor 1 Pins: Laser Chip to Jumper Wire to Arduino Due  
SS -> blue -> 10  
MO -> red -> MOSI  
SC -> green -> SCK  
MI -> purple -> MISO  
MOT -> yellow -> 2   
AG -> black -> GND  
GND -> grey -> GND  
VI -> brown -> 3.3V  
	BNC cable:  
		Red -> DAC1   
		Black -> GND  
  
Laser Sensor 2 Pins 
