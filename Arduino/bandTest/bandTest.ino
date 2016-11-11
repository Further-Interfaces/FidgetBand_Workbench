#include <FidgetBand.h>

const byte addr2 = 16;
const byte addr1 = 14; 
const byte addr0 = 15;

const int numSensors = 1;

const int LED = 17;


FidgetBand band;

void setup() {
  Serial.begin(9600);
  
  pinMode(addr0, OUTPUT);
  pinMode(addr1, OUTPUT);
  pinMode(addr2, OUTPUT);
  pinMode(LED, OUTPUT);
band.initBand();


}

void loop() {
  band.initBand();
  delay(500);
}

double setSensor(int i){
  digitalWrite(addr0, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(addr1, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(addr2, (i & 1) ? HIGH : LOW);
}

