import controlP5.*;

ControlP5 cp5;
Group sliceView;
Group barView;
Group settingsView;
ControlFont font;

Slice[] slices;

void setup(){
  size(1400,900);
  cp5 = new ControlP5(this);
  
  font = new ControlFont(loadFont("Avenir-Black-24.vlw"),241);
  
  slices = new Slice[5];
  
  //setupSliceView();
  //setupBarView();
  setupSettingsView();
}

void draw(){
  background(0); 
    Slice slice = new Slice(this,15000,8,400);
    slice.draw();
}

void setupSliceView(){
  sliceView = cp5.addGroup("sliceView")
                 .setPosition(300,0)
                 .setSize(1100,450)
                 .setBackgroundColor(color(255,50))
                 .hideBar();
                 

}

void setupBarView(){
  barView = cp5.addGroup("barView")
               .setPosition(300,450)
               .setSize(1100,450)
               .setBackgroundColor(color(255,255))
               .hideBar();
}

void setupSettingsView(){
  controlP5.Slider numSensorsSlider;
  controlP5.Textfield startFreqTextField;
  controlP5.Textfield freqIncTextField;
  controlP5.Slider numIncSlider;
  controlP5.Button startBtn;
  controlP5.Button stopBtn;
  
  settingsView = cp5.addGroup("settingsView")
                    .setPosition(0,0)
                    .setSize(300,900)
                    .setBackgroundColor(color(100,100))
                    .hideBar();
  
  //number of sensors slider
  cp5.addTextlabel("sensorsLabel")
     .setGroup(settingsView)
     .setText("Sensors")
     .setPosition(30,30)
     .setFont(createFont("Helvetica",20));
  
  numSensorsSlider = cp5.addSlider("Sensors")
     .setGroup(settingsView)
     .setPosition(30,60)
     .setWidth(200)
     .setRange(1,8)
     .setValue(2)
     .setNumberOfTickMarks(8)
     .setLabelVisible(false);
     
  //start frequency
  cp5.addTextlabel("startFreqLabel")
     .setGroup(settingsView)
     .setText("Start Frequency")
     .setPosition(30,130)
     .setFont(createFont("Helvetica",20));
     
  startFreqTextField = cp5.addTextfield("Start Frequency (kHz)")
     .setGroup(settingsView)
     .setPosition(30,160)
     .setSize(150,30)
     .setFont(font)
     .setFocus(false)
     .setColor(color(255,0,0))
     .setLabelVisible(false);
     
  cp5.addTextlabel("startkHzLabel")
     .setGroup(settingsView)
     .setPosition(182,170)
     .setText("kHz")
     .setFont(createFont("Helvetica",20));
  
  //frequency increment
    cp5.addTextlabel("freqIncLabel")
     .setGroup(settingsView)
     .setText("Frequency Increment")
     .setPosition(30,220)
     .setFont(createFont("Helvetica",20));
     
  freqIncTextField = cp5.addTextfield("Frequency Increment (kHz)")
     .setGroup(settingsView)
     .setPosition(30,250)
     .setSize(150,30)
     .setFont(font)
     .setFocus(false)
     .setColor(color(255,0,0))
     .setLabelVisible(false);
     
  cp5.addTextlabel("inckHzLabel")
     .setGroup(settingsView)
     .setPosition(182,260)
     .setText("kHz")
     .setFont(createFont("Helvetica",20));
  
  //number of increments slider
  cp5.addTextlabel("numIncLabel")
     .setGroup(settingsView)
     .setText("Number of Increments")
     .setPosition(30,310)
     .setFont(createFont("Helvetica",20));
     
  numIncSlider = cp5.addSlider("Number of Increments")
     .setGroup(settingsView)
     .setPosition(30,340)
     .setWidth(200)
     .setRange(0,5)
     .setValue(1)
     .setNumberOfTickMarks(6)
     .setLabelVisible(false);
  
  //start button
  startBtn = cp5.addButton("Start")
     .setGroup(settingsView)
     .setPosition(30,440)
     .setSize(200,40);
  
  startBtn.getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(24);
  
  //stop button
  stopBtn = cp5.addButton("Stop")
     .setGroup(settingsView)
     .setPosition(30,490)
     .setSize(200,40);
  
  stopBtn.getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(24);
     
}

/*
     - number of sensors
     - PGA (1x, 5x)
     - start frequency
     - frequency increment
     - number of frequency increments
     - start/stop collecting
          - when stop -> ask before save*/