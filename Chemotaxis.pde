//RPS [] rps;
PImage rock;
//PImage paper; 
//PImage scissor;

void setup () {
  size(400, 400);
  background(167, 167, 167);
  rock = loadImage("chemotaxisrock.jpg");
  //image(rock, 10, 10, 20, 20);

  /*

  rps = new RPS[50];
  for(int i = 0; i < rps.length/3; i++) {
    rps[i] = new RPS(1);
  }
  for(int i = rps.length/3; i < 2*rps.length/3; i++) {
    rps[i] = new RPS(2);
  }
  for(int i = 2*rps.length/3; i < rps.length; i++) {
    rps[i] = new RPS(3);
  }
  
  rock = loadImage("chemotaxisrock.jpeg");
  paper = loadImage("chemotaxispaper.jpeg");
  scissor = loadImage("chemotaxisscissor.jpeg");

  */

}

void draw() {
  image(rock, 10, 10, 20, 20);
}

/*

int mouseMode = 0;

class RPS {
  double myX, myY;
  int mode = 1;
  double left, right, upper, lower;
  double size = 25;
  
  RPS(int m) {
    myX = Math.random()*400;
    myY = Math.random()*400;
    mode = m;
    
  }
  
  void hitbox() {
    left = myX;
    right = myX + size;
    upper = myY;
    lower = myY + size;
  }
  
  void show() {
    double mX = mouseX;
    double mY = mouseY;
    double a = mX - myX;
    double b = mY - myY;
    double c = Math.sqrt(Math.pow(a, 2)+Math.pow(b, 2));
    if (mode == mouseMode && mousePressed) {
      myX += -a/a*2*(a/Math.pow(c, 2/3) + (a/Math.abs(a))*Math.random()*Math.pow(c, 1/2))/(30);
      myY += -b/b*2*(b/Math.pow(c, 2/3) + (b/Math.abs(b))*Math.random()*Math.pow(c, 1/2))/(30);
    }
    else if (mode == mouseMode) {
      myX += 2*(a/Math.pow(c, 2/3) + (a/Math.abs(a))*Math.random()*Math.pow(c, 1/2))/(12) + (((int)(Math.random()*2))*2-1)*(size/5);
      myY += 2*(b/Math.pow(c, 2/3) + (b/Math.abs(b))*Math.random()*Math.pow(c, 1/2))/(12) + (((int)(Math.random()*2))*2-1)*(size/5);
    } else {
      myX += (((int)(Math.random()*2))*2-1)*Math.random()*10;
      myY += (((int)(Math.random()*2))*2-1)*Math.random()*10;
    }
    if (mode == 1) {image(rock, (float)myX, (float)myY, (float)size, (float)size);}
    else if (mode == 2) {image(paper, (float)myX, (float)myY, (float)size, (float)size);}
    else if (mode == 3) {image(scissor, (float)myX, (float)myY, (float)size, (float)size);}

  }
}




void draw () {
  background(167);
  noFill();
  rect(62.5, 325, 50, 50);
  image(rock, 67.5, 330, 40, 40);
  rect(175, 325, 50, 50);
  image(paper, 180, 330, 40, 40);
  rect(287.5, 325, 50, 50);
  image(scissor, 292.5, 330, 40, 40);
  
  if (mousePressed &&  62.5 < mouseX && mouseX < 112.5 && 325 < mouseY && mouseY < 375) {
    mouseMode = 1;
  }
  if (mousePressed &&  175 < mouseX && mouseX < 225 && 325 < mouseY && mouseY < 375) {
    mouseMode = 2;
  }
  if (mousePressed && 287.5 < mouseX && mouseX < 337.5 && 325 < mouseY && mouseY < 375) {
    mouseMode = 3;
  }
  
  
  for (int j = 0; j < (rps.length/3)*3; j++) {
    rps[j].show();
    for (int k = 0; k < (rps.length/3)*3; k++) {
      rps[j].hitbox();
      rps[k].hitbox();
      int check = 0;
      if (rps[j].right >= rps[k].left) {check++;}
      if (rps[j].left <= rps[k].right) {check++;}
      if (rps[j].upper <= rps[k].lower) {check++;}
      if (rps[j].lower >= rps[k].upper) {check++;}
      
      if (check >= 4) {
      
              if (rps[j].mode == 1 && rps[k].mode == 2) {rps[j].mode = 2;}
         else if (rps[j].mode == 1 && rps[k].mode == 3) {rps[k].mode = 1;}
         
         else if (rps[j].mode == 2 && rps[k].mode == 1) {rps[k].mode = 2;}
         else if (rps[j].mode == 2 && rps[k].mode == 3) {rps[j].mode = 3;}
         
         else if (rps[j].mode == 3 && rps[k].mode == 1) {rps[j].mode = 1;}
         else if (rps[j].mode == 3 && rps[k].mode == 2) {rps[k].mode = 3;}

      }
    }
  }
}

*/
