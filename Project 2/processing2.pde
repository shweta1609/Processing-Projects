int x,y,direction,speed;
boolean moveRight, stop;

void setup(){
  //setting size of the sketch window
  size(600, 600);
  stroke(0);
  strokeWeight(2.5);
  //initializing variables
  x=150;
  y=200;
  speed = 1;
  //initially the character will be stopped until keypressed
  stop = true;
  direction = 0;
}

void draw(){
  background(#5AE57C);
  //change the position of the character based on direction and speed
    x = x + direction*speed;
    //if right end of sketch window is reached, change the position to the left end of the window
    if(x > width-50){
      x = 50;
    }
    //if left end of sketch window is reached, change the position to the right end of the window
    if (x < 50){
      x = width-50;
    }
    //drawing upper body
    fill(#E3B330);
    rect(x-15, y+20, 30, 45);
    //text GT on tshirt
    fill(0);
    textSize(10);
    text("GT", x-6, y+42);
    //drawing lower body
    fill(#391EB7);
    quad(x-15, y+50, x+15, y+50, x+25, y+75, x-25, y+75);
    //drawing face
    fill(#FFF0E3);
    ellipse(x, y, 50, 50);
    //drawing eyes
    fill(255);
    ellipse(x-10, y-5, 20, 20);
    ellipse(x+10, y-5, 20, 20);
    //drawing ears
    ellipse(x+25, y+10, 5, 5);
    ellipse(x-25, y+10, 5, 5);
    //drawing neck
    arc(x, y+25, 15, 10, 0, PI, OPEN);
    //drawing nose
    line(x, y+5, x-2, y+10);
    line(x+2, y+10, x-2, y+10);
    //drawing legs
    line(x-5, y+75, x-5, y+95);
    line(x+5, y+75, x+5, y+95);
    if(!stop){
      //drawing mouth
      //Look happy when no keypressed
      fill(#F50F0F);
      arc(x, y+15, 15, 10, 0, PI, CHORD);
      if(moveRight){
        //drawing eye balls
        println("Move right when right key pressed");
        fill(0);
        ellipse(x-5, y-5, 10, 10);
        ellipse(x+15, y-5, 10, 10);
        //drawing hands
        //right hand up pointing in right direction
        line(x+15, y+20, x+22, y+35);
        line(x+22, y+35, x+30, y+20);
        line(x+35, y+20, x+30, y+20);
        //left hand elbow down
        line(x-15, y+20, x-22, y+35);
        line(x-22, y+35, x-22, y+50);
        //feet direction towards left
        line(x, y+95, x-5, y+95);
        line(x+10, y+95, x+5, y+95);
        direction = 1;
      }
      else{
        //drawing eye balls
        println("Move left when left key pressed");
        fill(0);
        //eye-balls looking in left direction
        ellipse(x-15, y-5, 10, 10);
        ellipse(x+5, y-5, 10, 10);
        //drawing hands
        //left hand up pointing in left direction
        line(x-15, y+20, x-22, y+35);
        line(x-22, y+35, x-30, y+20);
        line(x-35, y+20, x-30, y+20);
        //right hand elbow down
        line(x+15, y+20, x+22, y+35);
        line(x+22, y+35, x+22, y+50);
        //feet direction towards left
        line(x-10, y+95, x-5, y+95);
        line(x, y+95, x+5, y+95);
        direction = -1;
      }
    }
    else{
      //No movement as stop variable is true, set change value to 0
      direction = 0;
      //drawing mouth
      println("Look surprised when stopped");
      fill(#F50F0F);
      //surprised face with ellipse
      ellipse(x, y+20, 5, 5);
      //drawing eye balls
      fill(0);
      //looking straight when stopped
      ellipse(x-10, y-5, 10, 10);
      ellipse(x+10, y-5, 10, 10);
      //drawing hands
      //both arms straight
      line(x-15, y+20, x-30, y+50);
      line(x+15, y+20, x+30, y+50);
    }
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == LEFT) {
      //set boolean variable 'stop' to false when LEFT key is pressed
      stop = false;
      //set boolean variable 'moveRight' to false when LEFT key is pressed
      moveRight = false;
    } else if (keyCode == RIGHT) {
      //set boolean variable 'stop' to false when RIGHT key is pressed
      stop = false;
      //set boolean variable 'moveRight' to true when RIGHT key is pressed
      moveRight = true;
    }
  }
  else{
    //set boolean variable 'stop' to true when key any other key is pressed
      stop = true;
    }
}
void keyReleased(){
  //set boolean variable 'stop' to true when key is released
  stop = true;
}