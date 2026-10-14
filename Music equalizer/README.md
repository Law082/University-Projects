# Audio Visualizer / Equalizer

## Overview

This project involves creating an audio spectrum analyzer (Audio Visualizer) capable of visually representing sound amplitude. Using a microphone to capture music or ambient noise, the system applies the Fast Fourier Transform (FFT) to decompose the complex signal into individual frequencies, which are then displayed on an LED matrix.

## Features

- Real-time sound capture using a microphone module.
- Audio signal processing via the Fast Fourier Transform (FFT) to convert time-domain signals into amplitude-mapped frequency domains.
- Frequency spectrum display on an 8x8 Bi-Color LED Matrix.

## Technologies Used

- Hardware: Arduino development board.
- Hardware: Microphone module.
- Hardware: 8x8 Bi-Color LED Matrix.
- Software / Concepts: Fast Fourier Transform (FFT) algorithm for complex signal processing.

## Architecture

The system is centered around an Arduino board. Both the microphone and the LED matrix are powered at 5V. The microphone reads sound variations as an analog input. The Arduino processes these values using the Fast Fourier Transform (FFT), a mathematical operation that extracts the component frequencies of the sound. The results are sent to the LED matrix using the default communication pins: LATCH (SS) connected to pin D4, DATA (MOSI) connected to pin D6, and CLOCK connected to pin D5.

## Results

- The project successfully maps human hearing frequency ranges (from Sub-Bass to Hiss) onto the LED matrix columns, with the amplitude dictating the height of each illuminated column.

## Documentation

[Presentation](Presentation-12.pptx)
