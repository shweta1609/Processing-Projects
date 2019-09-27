//Press LEFT arrow key to move character to the left
//Press RIGHT arraw key to move character to the right
//Press UP arrow key to make character jump

class Character{
  float facePosx;
  float facePosy;
  //constructor of this class
  Character(float xPos, float yPos){
    facePosx = xPos;
    facePosy = yPos;
  }
  //method to display the character on the sketchbook when no action is taking place
  void display(){
    //update the position of the character
    facePosx = facePosx + direction*speed;
    //if right end of sketch window is reached, change the position to the left end of the window
    if(facePosx > width-50){
      facePosx = 50;
    }
    //if left end of sketch window is reached, change the position to the right end of the window
    if (facePosx < 50){
      facePosx = width-50;
    }
    //drawing upper body
    fill(#E3B330);
    rect(facePosx-15, facePosy+20, 30, 45);
    //text GT on tshirt
    fill(0);
    textSize(10);
    text("GT", facePosx-6, facePosy+42);
    //drawing lower body
    fill(#391EB7);
    quad(facePosx-15, facePosy+50, facePosx+15, facePosy+50, facePosx+25, facePosy+75, facePosx-25, facePosy+75);
    //drawing face
    fill(#FFF0E3);
    ellipse(facePosx, facePosy, 50, 50);
    //drawing eyes
    fill(255);
    ellipse(facePosx-10, facePosy-5, 20, 20);
    ellipse(facePosx+10, facePosy-5, 20, 20);
    //drawing ears
    ellipse(facePosx+25, facePosy+10, 5, 5);
    ellipse(facePosx-25, facePosy+10, 5, 5);
    //drawing neck
    arc(facePosx, facePosy+25, 15, 10, 0, PI, OPEN);
    //drawing nose
    line(facePosx, facePosy+5, facePosx-2, facePosy+10);
    line(facePosx+2, facePosy+10, facePosx-2, facePosy+10);

    fill(#F50F0F);
    if(stop == true && jump == false){
      //make direction = 0 to stop character from moving
      direction = 0;
      //weird face when stopped
      strokeWeight(1.5);
      rect(facePosx-5, facePosy+15, 10, 3);
      //drawing eye balls
      strokeWeight(2.5);
      fill(0);
      //looking straight when stopped
      ellipse(facePosx-10, facePosy-5, 10, 10);
      ellipse(facePosx+10, facePosy-5, 10, 10);
      //drawing hands
      //both arms straight
      line(facePosx-15, facePosy+20, facePosx-30, facePosy+50);
      line(facePosx+15, facePosy+20, facePosx+30, facePosy+50);
      //drawing legs
      line(facePosx-5, facePosy+75, facePosx-5, facePosy+95);
      line(facePosx+5, facePosy+75, facePosx+5, facePosy+95);
    }
  }

  //method to move the character left of right based on the key pressed
  void move(boolean moveRight){
    if(!stop){
      //drawing mouth
      //Look happy when no keypressed
      fill(#F50F0F);
      arc(facePosx, facePosy+15, 15, 10, 0, PI, CHORD);
      if(moveRight){
        //drawing eye balls
        println("Move right when RIGHT key pressed");
        fill(0);
        ellipse(facePosx-5, facePosy-5, 10, 10);
        ellipse(facePosx+15, facePosy-5, 10, 10);
        //drawing hands
        //right hand up pointing in right direction
        line(facePosx+15, facePosy+20, facePosx+22, facePosy+35);
        line(facePosx+22, facePosy+35, facePosx+30, facePosy+20);
        line(facePosx+35, facePosy+20, facePosx+30, facePosy+20);
        //left hand elbow down
        line(facePosx-15, facePosy+20, facePosx-22, facePosy+35);
        line(facePosx-22, facePosy+35, facePosx-22, facePosy+50);
        //drawing legs
        line(facePosx-5, facePosy+75, facePosx-5, facePosy+95);
        line(facePosx+5, facePosy+75, facePosx+5, facePosy+95);
        //feet direction towards left
        line(facePosx, facePosy+95, facePosx-5, facePosy+95);
        line(facePosx+10, facePosy+95, facePosx+5, facePosy+95);
        direction = 1;
      }
      else{
        //drawing eye balls
        println("Move left when LEFT key pressed");
        fill(0);
        //eye-balls looking in left direction
        ellipse(facePosx-15, facePosy-5, 10, 10);
        ellipse(facePosx+5, facePosy-5, 10, 10);
        //drawing hands
        //left hand up pointing in left direction
        line(facePosx-15, facePosy+20, facePosx-22, facePosy+35);
        line(facePosx-22, facePosy+35, facePosx-30, facePosy+20);
        line(facePosx-35, facePosy+20, facePosx-30, facePosy+20);
        //right hand elbow down
        line(facePosx+15, facePosy+20, facePosx+22, facePosy+35);
        line(facePosx+22, facePosy+35, facePosx+22, facePosy+50);
        //drawing legs
        line(facePosx-5, facePosy+75, facePosx-5, facePosy+95);
        line(facePosx+5, facePosy+75, facePosx+5, facePosy+95);
        //feet direction towards left
        line(facePosx-10, facePosy+95, facePosx-5, facePosy+95);
        line(facePosx, facePosy+95, facePosx+5, facePosy+95);
        direction = -1;
      }
    }
  }

  //method to make the character jump when UP arrow key is pressed
  void jump(int high){
    println("Jump up when UP key pressed");
    //change the y-coordinates to make the character jump up
    facePosy = facePosy - high;
    background(#5AE57C);
    //redraw the base body with new y-coordinates
    display();
    //make a surprised face
    ellipse(facePosx, facePosy+18, 5, 5);
    //drawing eye balls
    fill(#4ACBC8);
    //looking straight when stopped
    ellipse(facePosx-10, facePosy-5, 10, 10);
    ellipse(facePosx+10, facePosy-5, 10, 10);
    //hands
    line(facePosx-15, facePosy+20, facePosx-45, facePosy);
    line(facePosx+15, facePosy+20, facePosx+45, facePosy);
    //legs
    line(facePosx-5, facePosy+75, facePosx-15, facePosy+90);
    line(facePosx+5, facePosy+75, facePosx+15, facePosy+90);
    //resetting y coordinates to the original height
    facePosy = facePosy + high;
  }
}

Character myChar;
boolean stop, moveRight, jump;
int direction,speed;
void setup(){
  //initialize the canvas size
  size(800,600);
  stroke(0);
  strokeWeight(2.5);
  //create an object of Character class
  myChar = new Character(150,250);
  //initialize boolean variables to default values
  stop = true;
  jump = false;
  direction = 0;
  speed = 2;
}

void draw(){
  background(#5AE57C);
  //call display method of Character class
  myChar.display();
  //call move method of Character class and pass moveRight boolean variable
  myChar.move(moveRight);
  if(jump){
    //if boolean variable jump is true, call jump method of Character class and pass the height upto which character should jump
    myChar.jump(100);
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
    else if(keyCode == UP){
      //set boolean variable 'jump' to true when UP key is pressed
      jump = true;
    }
  }
  else{
    //set boolean variable 'stop' to true when key any other key is pressed
      stop = true;
    }
}
void keyReleased(){
  //set boolean variable 'stop' to true and 'jump' to false when key is released
  stop = true;
  jump = false;
}