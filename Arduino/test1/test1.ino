#include <MultiAD5933.h>
#include <Wire.h>

const byte addr2 = 16;
const byte addr1 = 14; 
const byte addr0 = 15;

const int numSensors = 4;

const int LED = 17;

AD5933 sensor;

void setup() {
  Serial.begin(9600);
  Wire.begin();

  pinMode(addr0, OUTPUT);
  pinMode(addr1, OUTPUT);
  pinMode(addr2, OUTPUT);
  pinMode(LED, OUTPUT);

  for(int i = 0; i < numSensors; i++){
    setSensor(i);
    sensor.reset();
    sensor.writeStartFreq(30000);
    sensor.writeFreqStepVal(1000);
    sensor.writeNumSteps(1);
    //sensor.writeSettlingTimeCycles(10);
    //sensor.standby();
    if(i == 0){
      sensor.initStartFreq();
      sensor.startFreqSweep();
    }else{
      //sensor.initStartFreq();
      sensor.startFreqSweep(); 
    }
    //sensor.startFreqSweep();
  }
}

void loop() {
  for(int i = 0; i < numSensors; i++){
    setSensor(i);
    //sensor.writeStartFreq(30000);
    double imp = sensor.readMagnitude();
    Serial.println(imp);
  }
  Serial.println("-----");
  delay(500);
}

double setSensor(int i){
  digitalWrite(addr0, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(addr1, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(addr2, (i & 1) ? HIGH : LOW);
}

