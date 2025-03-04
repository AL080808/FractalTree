private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  

public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 

public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320, 380, 100, 3*Math.PI/2);  // Recursive call starts here
} 

public void drawBranches(int x, int y, double branchLength, double angle) 
{   
	if (branchLength < smallestBranch) {
		return; // Base case: stop recursion when branch is too small
	}
	
	double angle1 = angle + branchAngle; // Right branch angle
	double angle2 = angle - branchAngle; // Left branch angle
	
	branchLength *= fractionLength; // Reduce branch length
	
	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y);
	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);
	
	stroke(0, 255, 0);
	line(x, y, endX1, endY1); // Draw right branch
	line(x, y, endX2, endY2); // Draw left branch
	
	drawBranches(endX1, endY1, branchLength, angle1); // Recur for right branch
	drawBranches(endX2, endY2, branchLength, angle2); // Recur for left branch
}
