#include "OliLedMatrix.h"

/* LED MATRIX PINS */
#define LED_LATCH 4
#define LED_DATA 6
#define LED_CLOCK 5

#define MIC A0   // IMPORTANT: pin analog corect

#define SAMPLES 128
#define COLUMNS 8

int data[SAMPLES];
int colData[COLUMNS];

int index = 0;

// setup pins for led Matrix
OliLedMatrix ledMatrix(LED_LATCH, LED_DATA, LED_CLOCK);

void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(MIC);
  delay(5);  // mic sampling delay

  data[index] = val;
  index++;

  if (index >= SAMPLES) {
    int maxVal = 0;

    // Calcul medii pe coloane
    for (int i = 0; i < COLUMNS; i++) {
      int valMedie = 0;

      for (int j = (SAMPLES / COLUMNS) * i; j < ((SAMPLES / COLUMNS) * (i + 1)); j++) {
        valMedie += data[j];
      }

      valMedie = valMedie / (SAMPLES / COLUMNS);
      colData[i] = valMedie;

      if (maxVal < valMedie) {
        maxVal = valMedie;
      }
    }

    // Protecție împărțire la 0
    if (maxVal == 0) maxVal = 1;

    ledMatrix.clear();

    // Afișare pe matrice
    for (int i = 0; i < 8; i++) {

      // eliminare zgomot mic
      if (colData[i] < 55) {
        colData[i] = 0;
      }

      // scalare pe 8 LED-uri (înălțimea matricei)
      int height = (colData[i] * 8) / maxVal;

      // desenare bară verticală
      ledMatrix.drawLine(0, i, height);

      Serial.println(height);
    }

    ledMatrix.display();

    delay(50);
    index = 0;
  }
}