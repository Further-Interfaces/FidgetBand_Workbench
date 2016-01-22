import processing.core.*;

public class Slice extends PApplet{
  PApplet parent;
  
  private int freq;
  private int numSensors;
  private int size;
  
  private PVector[] nodePositions;
  
  public Slice(PApplet parent, int freq, int numSensors, int size){
    this.parent = parent;
    this.freq = freq;
    this.numSensors = numSensors;
    this.size = size;
    
    this.setSize(size);
  }
  
  public void draw(){
    parent.ellipse(500,500,size,size);
    this.drawNodes();
  }
  
  public void setSize(int size){
     nodePositions = this.calcNodePositions();
  }
  
  private PVector[] calcNodePositions(){
    PVector[] positions = new PVector[numSensors];
    float circleRadius = size/2.0;
    float nodeSpacing = TWO_PI/(float)numSensors;
    
    float curAngle = 0.0;
    int i = 0;
    while(i < this.numSensors){
      float x = circleRadius * cos(curAngle);
      float y = circleRadius * sin(curAngle);
      positions[i] = new PVector(x,y);
      curAngle += nodeSpacing;
      i++;
    }
    
    return positions;
  }
  
  private void drawNodes(){
    if(nodePositions != null){
      float nodeSize = this.size/20.0;
      parent.ellipseMode(CENTER);
      parent.fill(0);
      for(int i = 0; i < nodePositions.length; i++){
        PVector pos = nodePositions[i];
        parent.ellipse(pos.x,pos.y,nodeSize,nodeSize);
      }
    }
  }
}