// When this file is run, mario starts walking in right direction and music starts playing
// Pressing LEFT arrow key changes mario's direction to the left, music does not change and continues playing
// Mario walking to right has eyes closed //ANIMATION 1
// Pressing RIGHT arrow key changes mario's direction to the right, music does not change and continues playing
// Mario walking to left has eyes opened //ANIMATION 2
// Clicking mouse once stops the mario at it's position with little animation of sudden stopping and a new sound effect //ANIMATION 3

import ddf.minim.*;
// Creating Image objects
PImage base;
PImage[] mario = new PImage[19];
// Intializing image index to 1
int a = 1;
// Initial position of the character mario
int position = 10;
// Speed at which the character moves
int speed = 10;
// Boolean variables to determine different animated states
boolean swap, event, stop;
// AudioPlayer object to load music files
AudioPlayer music_stop, music_walk;
Minim minim;
void setup(){
  size(800,600);
  frameRate(30);
  // Setting swap to false as to not change direction
  swap = false;
  // Setting event and stop to false as to keep mario moving until mouse clicked
  event = false;
  stop = false;
  // Loading background image
  base = loadImage("background.jpg");
  for(int i=1; i<=18; i++){
    String imgName = "mario" + str(i) + ".png";
    mario[i] = loadImage(imgName);
  }
  // Loading music files
  minim = new Minim(this);
  music_stop = minim.loadFile("mario-stop.wav");
  music_walk = minim.loadFile("mario-walk.wav");
  music_walk.loop();
}

void draw(){
  //Drawing background image
  image(base,0,0,width,height);
  display();
}

void display(){
  // When swap is false and mouse is not clicked, moving mario to the left
  if(!swap){
    if(a>6 && !event){
      //As we only want eyes-closed mario in Left direction, moving back array index to 1
      a=1;
    }
    image(mario[a],position,height-280,200,200);
    //For left direction movement, we need to increase x-position
    position = position+speed;
    if(position>width){
      position = 10;
    }
  }
  else
  {
    if(a>12 && !event){
      //As we only want eyes-opened mario in right direction, moving back array index to 7
      a = 7;
    }
    // Flipping the image on x-axis to move the object face to left
    pushMatrix();
    scale(-1.0, 1.0);
    image(mario[a],-position,height-280,200,200);
    popMatrix();
    //For right direction movement, we need to decrease x-position
    position = position-speed;
    if(position<0){
      position = width - 10;;
    }
  }
  if(!stop){
    // Change the image for animation only if object is moving
    a = a+1;
  }
  if(a>18){
    // Mouse clicked, object is stopped, set to a stable character position and set stop to true
      a = 13;
      stop = true;
    }
}

void keyPressed(){
  // If music was stopped earlier, start it again
  if(stop)
    music_walk.loop();
  if(keyCode==LEFT){
    // If LEFT key is pressed, pick images with mario's eyes open
    a = 7;
    // Set swap to true to change direction to LEFT
    swap = true;
  } else if(keyCode ==RIGHT){
    // If RIGHT key is pressed, pick images with mario's eyes closed
    a = 1;
    // Set swap to true to change direction to RIGHT
    swap = false;
  }
  // Reset the variables to NOT MOVING state
  speed = 10;
  stop = false;
  event = false;
  //Rewind the stop sound effect to be played next time
  music_stop.rewind();
}

void mouseClicked(){
  // If mouse is clicked, pick images where mario is suddenly stopping
    a = 13;
    event = true;
    // Set speed to 0 to stop displacement
    speed = 0;
    // Stop the music playing while walking
    music_walk.pause();
    // Start the stop sound effect
    music_stop.play();
    //Rewind the walk sound effect to be played next time
    music_walk.rewind();
}