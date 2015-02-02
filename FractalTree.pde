private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .25;  
int s = 0;
public void setup() 
{ 
  size(640,480); 
} 

public void draw() 
{   
  stroke(0,s/2,s);   
  line(320,480,320,380);   
  drawBranches(320, 450, 100, 3*Math.PI/2);
  if(s<255){s++;}
  else{s=-s;}
} 

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double a1 = angle + branchAngle;
  double a2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX = (int)(branchLength*Math.cos(a1) + x);
  int endY = (int)(branchLength*Math.sin(a1) + y);
  int endX2 = (int)(branchLength*Math.cos(a2) + x);
  int endY2 = (int)(branchLength*Math.sin(a1) + y);
  line(x, y, endX,endY);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX, endY, branchLength, a1);
    drawBranches(endX2, endY2, branchLength, a2);
  }
} 
