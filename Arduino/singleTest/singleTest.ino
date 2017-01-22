#include <MultiAD5933.h>

const byte mux_OUT_addr2 = 16;
const byte mux_OUT_addr1 = 14; 
const byte mux_OUT_addr0 = 15;

const byte mux_IN_addr2 = 7;
const byte mux_IN_addr1 = 8; 
const byte mux_IN_addr0 = 9;

const int numElectrodes = 8;

const int LED = 17;

AD5933 sensor;

void setup() {
  Serial.begin(9600);

  pinMode(mux_OUT_addr2, OUTPUT);
  pinMode(mux_OUT_addr1, OUTPUT);
  pinMode(mux_OUT_addr0, OUTPUT);
  pinMode(mux_IN_addr2, OUTPUT);
  pinMode(mux_IN_addr1, OUTPUT);
  pinMode(mux_IN_addr0, OUTPUT);
  pinMode(LED, OUTPUT);

  sensor.reset();
  sensor.writeStartFreq(30000);
  sensor.writeFreqStepVal(1000);
  sensor.writeNumSteps(1);
  sensor.writeSettlingTimeCycles(10);
  sensor.standby();
  sensor.initStartFreq();
  sensor.startFreqSweep();
}

void loop() {
  measure();
  Serial.println("-----");
  delay(500);
}

void measure() {
  int numMeasurements = (numElectrodes * (numElectrodes - 1)) / 2;
  for(int i = 0; i < numElectrodes-1; i++) {
     for(int j = i+1; j < numElectrodes; j++){
        transmit(i);
        double val = receive(j);
        Serial.println(val);
     }
  }
}

void transmit(int idx){
  setOutputElectrode(idx);
  sensor.initStartFreq();
  sensor.startFreqSweep();
}

double receive(int idx){
  setInputElectrode(idx);
  double val = sensor.readMagnitude();
  sensor.repeatFreq();
  return val;
}

void setInputElectrode(int i){
  digitalWrite(mux_IN_addr0, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(mux_IN_addr1, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(mux_IN_addr2, (i & 1) ? HIGH : LOW);
}

void setOutputElectrode(int i){
  digitalWrite(mux_OUT_addr0, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(mux_OUT_addr1, (i & 1) ? HIGH : LOW);
  i >>= 1;
  digitalWrite(mux_OUT_addr2, (i & 1) ? HIGH : LOW);
}


