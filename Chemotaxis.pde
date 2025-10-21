RPS [] rps;
PImage rock;
PImage paper; 
PImage scissor;

void setup () {
  size(400, 400);
  background(167, 167, 167);
  rock = loadImage("chemotaxisrock.jpeg");
  paper = loadImage("chemotaxispaper.jpeg");
  scissor = loadImage("chemotaxisscissor.jpeg");

  rps = new RPS[50];

  for(int i = 0; i < rps.length/3; i++) {
    rps[i] = new RPS(1);
  }
  for(int i = (int)(rps.length/3); i < 2*rps.length/3; i++) {
    rps[i] = new RPS(2);
  }
  for(int i = 2*(int)(rps.length/3); i < rps.length; i++) {
    rps[i] = new RPS(3);
  }
}

int mouseMode = 0;

class RPS {
  float myX, myY;
  int mode = 1;
  float left, right, upper, lower;
  float size = 25;
  
  RPS(int m) {
    myX = (float)(Math.random()*400);
    myY = (float)(Math.random()*400);
    mode = m;
    
  }
  
  void hitbox() {
    left = myX;
    right = myX + size;
    upper = myY;
    lower = myY + size;
  }
  
  void show() {
    float mX = mouseX;
    float mY = mouseY;
    float a = mX - myX;
    float b = mY - myY;
    float c = (float)(Math.sqrt(Math.pow(a, 2)+Math.pow(b, 2)));
    if (c < 0.001) {c = 0.001;}
    float signA; if (a == 0) {signA = 0;} else {signA = a/Math.abs(a);}
    float signB; if (b == 0) {signB = 0;} else {signB = b/Math.abs(b);}

    if (mode == mouseMode && mousePressed) {
      myX += -signA*2*(a + (a/Math.abs(a))*Math.random())/(30);
      myY += -signB*2*(b + (b/Math.abs(b))*Math.random())/(30);

      //myX += -signA*2 + (a)*Math.random()/(30);
      //myY += -signB*2 + (b)*Math.random()/(30);
    }
    else if (mode == mouseMode) {
      myX += 2*(a + signA*Math.random())/(12) + (((int)(Math.random()*2))*2-1)*(size/5);
      myY += 2*(b + signB*Math.random())/(12) + (((int)(Math.random()*2))*2-1)*(size/5);

      //myX += 2 + signA*Math.random()/(12) + (((int)(Math.random()*2))*2-1)*(size/5);
      //myY += 2 + signB*Math.random()/(12) + (((int)(Math.random()*2))*2-1)*(size/5);
    } else {
      myX += (((int)(Math.random()*2))*2-1)*Math.random()*10;
      myY += (((int)(Math.random()*2))*2-1)*Math.random()*10;
    }
    if (mode == 1) {image(rock, (float)myX, (float)myY, (float)size, (float)size);}
    else if (mode == 2) {image(paper, (float)myX, (float)myY, (float)size, (float)size);}
    else if (mode == 3) {image(scissor, (float)myX, (float)myY, (float)size, (float)size);}

    if (myX < -100) myX = 500;
    if (myX > 500) myX = -100;
    if (myY < -100) myY = 500;
    if (myY > 500) myY = -100;
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
    if (rps[j] == null) continue;
    rps[j].show();
    rps[j].hitbox();
    for (int k = 0; k < (rps.length/3)*3; k++) {
      if (rps[k] == null || j == k) continue;
      rps[k].hitbox();

      int check = 0;
      if (rps[j].right >= rps[k].left) {check++;}
      if (rps[j].left <= rps[k].right) {check++;}
      if (rps[j].upper <= rps[k].lower) {check++;}
      if (rps[j].lower >= rps[k].upper) {check++;}
      
      if (check >= 4) {
      
              if (rps[j].mode == 1 && rps[k].mode == 2) {rps[j].mode = 2;}
         else if (rps[j].mode == 1 && rps[k].mode == 3) {rps[k].mode = 1;}
         else if (rps[j].mode == 2 && rps[k].mode == 3) {rps[j].mode = 3;}

      }

      /*

      boolean overlap = !(rps[j].right < rps[k].left ||
                    rps[j].left > rps[k].right ||
                    rps[j].lower < rps[k].upper ||
                    rps[j].upper > rps[k].lower);

      if (overlap) {
        if (rps[j].mode == 1 && rps[k].mode == 2) {rps[j].mode = 2;}
        else if (rps[j].mode == 1 && rps[k].mode == 3) {rps[k].mode = 1;}
        else if (rps[j].mode == 2 && rps[k].mode == 1) {rps[k].mode = 2;}
        else if (rps[j].mode == 2 && rps[k].mode == 3) {rps[j].mode = 3;}
        else if (rps[j].mode == 3 && rps[k].mode == 1) {rps[j].mode = 1;}
        else if (rps[j].mode == 3 && rps[k].mode == 2) {rps[k].mode = 3;}
      }

      */

    }
  }
}
