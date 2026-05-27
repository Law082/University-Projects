const int buttonPin = 13;   // Button input pin
const int ledPin = 12;      // LED output pin

void setup() {
  pinMode(buttonPin, INPUT_PULLUP);  // Use internal pull-up resistor
  pinMode(ledPin, OUTPUT);           // LED pin as output
  Serial.begin(115200);              // Serial communication for Simulink
}

void loop() {
  int buttonState = digitalRead(buttonPin);

  // LED ON when button is pressed
  // With INPUT_PULLUP: pressed = LOW (0), released = HIGH (1)
  if (buttonState == LOW) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
  }

  // Send button state to Simulink
Serial.write(buttonState);

  delay(5);  // Small delay for stable serial output
}
