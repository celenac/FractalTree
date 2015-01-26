private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
int backgroundColor=255;
int numClicks=0;
public void setup() 
{   
	size(640,480);    
	noLoop(); 

} 
public void draw() 
{   
	background(backgroundColor);   
	stroke(0,255,100);   
	line(320,480,320,380);   
	drawBranches(320,380,100, 3*Math.PI/2);
} 

void mousePressed()
{
	if(mouseButton==LEFT)
	{
		numClicks++;
		if(numClicks%2==1)
		{
			backgroundColor=0;
		}
		else if(numClicks%2==0)
		{
			backgroundColor=255;
		}
		redraw();
	}
	if(mouseButton==RIGHT)
	{
		redraw();
	}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1=angle+branchAngle;
	double angle2=angle-branchAngle;
	branchLength=branchLength*fractionLength;
	int endX1=(int)(branchLength*Math.cos(angle1)+x);
	int endY1=(int)(branchLength*Math.sin(angle1)+y); 
	int endX2=(int)(branchLength*Math.cos(angle2)+x);
	int endY2=(int)(branchLength*Math.sin(angle2)+y);
	stroke((int)(Math.random()*6),(int)(Math.random()*255), (int)(Math.random()*32));
	line(x,y,endX1,endY1);
	stroke((int)(Math.random()*6),(int)(Math.random()*255), (int)(Math.random()*32));
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 