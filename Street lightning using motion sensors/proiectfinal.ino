#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

const char *ssid = "Lau";
const char *password = "12345678";

int led1 = 14;
int sensor1 = 16;
int state1 = LOW;
int val1 = 0;

int led2 = 12;
int sensor2 = 5;
int state2 = LOW;
int val2 = 0;

int led3 = 15;
int sensor3 = 4;
int state3 = LOW;
int val3 = 0;

int wifiLed = 13;
int defaultIntensity = 50;

ESP8266WebServer server(80);

void handleRoot() {
  String html = "<html><body>";
  html += "<h1>Stare Monitorizare</h1>";
  html += "<p>Stare Senzor 1: " + String(val1 == HIGH ? "Detecteaza miscare" : "Nu Detecteaza miscare") + "</p>";
  html += "<p>Stare Senzor 2: " + String(val2 == HIGH ? "Detecteaza miscare" : "Nu Detecteaza miscare") + "</p>";
  html += "<p>Stare Senzor 3: " + String(val3 == HIGH ? "Detecteaza miscare" : "Nu Detecteaza miscare") + "</p>";
  html += "</body></html>";
  server.send(200, "text/html", html);
}


void setup() {
  pinMode(led1, OUTPUT);
  pinMode(sensor1, INPUT);

  pinMode(led2, OUTPUT);
  pinMode(sensor2, INPUT);

  pinMode(led3, OUTPUT);
  pinMode(sensor3, INPUT);

  pinMode(wifiLed, OUTPUT);

  Serial.begin(115200);

  // Conectarea la WiFi
  WiFi.begin(ssid, password);
  Serial.print("Connecting to ");
  Serial.print(ssid);

  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED && attempts < 20) {
    digitalWrite(wifiLed, LOW);
    delay(1000);
    Serial.print(".");
    attempts++;
  }

  if (WiFi.status() == WL_CONNECTED) {
    digitalWrite(wifiLed, HIGH);
    Serial.println("\nConnected to WiFi");
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());
  } else {
    Serial.println("\nFailed to connect to WiFi");
  }

  server.on("/", HTTP_GET, handleRoot);

  server.begin();
}

void loop() {
  server.handleClient();

  val1 = digitalRead(sensor1);
  val2 = digitalRead(sensor2);
  val3 = digitalRead(sensor3);

  Serial.print("Stare Senzor 1: ");
  Serial.println(val1 == HIGH ? "Detectează mișcare" : "Nu detectează mișcare");

  Serial.print("Stare Senzor 2: ");
  Serial.println(val2 == HIGH ? "Detectează mișcare" : "Nu detectează mișcare");

  Serial.print("Stare Senzor 3: ");
  Serial.println(val3 == HIGH ? "Detectează mișcare" : "Nu detectează mișcare");

  if (val1 == HIGH) {
    analogWrite(led1, 255);
  } else {
    analogWrite(led1, defaultIntensity);
  }

  if (val2 == HIGH) {
    analogWrite(led2, 255);
  } else {
    analogWrite(led2, defaultIntensity);
  }

  if (val3 == HIGH) {
    analogWrite(led3, 255);
  } else {
    analogWrite(led3, defaultIntensity);
  }
}