void setup() {
  //sketchbook size
  size(400, 300);
  stroke(0);
  strokeWeight(2.5);
}

void draw() {
  if (mousePressed) {
    println("Make background blue when mouse pressed");
    background(#399EF5);
    strokeWeight(3);
    println("Move hands up when mouse pressed");
    //hands
    line(85, 120, 55, 100);
    line(115, 120, 145, 100);
    println("Move legs up when mouse pressed");
    //legs
    line(95, 175, 85, 190);
    line(105, 175, 115, 190);
  } else {
    background(#5AE57C);
    //hands
    line(85, 120, 70, 150);
    line(115, 120, 130, 150);
    //legs
    line(95, 175, 95, 195);
    line(105, 175, 105, 195);
  }
  //upper body
  fill(#E3B330);
  rect(85, 120, 30, 45);
  //text GT on tshirt
  fill(0);
  textSize(10);
  text("GT", 94, 142);
  //lower body
  fill(#391EB7);
  quad(85, 150, 115, 150, 125, 175, 75, 175);
  //face
  fill(#FFF0E3);
  ellipse(100, 100, 50, 50);
  //eyes
  fill(255);
  ellipse(90, 95, 20, 20);
  ellipse(110, 95, 20, 20);
  //ears
  ellipse(125, 110, 5, 5);
  ellipse(75, 110, 5, 5);
  //neck
  arc(100, 125, 15, 10, 0, PI, OPEN);
  //nose
  line(100, 105, 98, 110);
  line(102, 110, 98, 110);


  if (keyPressed == true) {
    //eye balls
    println("Look right when key pressed");
    fill(0);
    ellipse(95, 100, 5, 5);
    ellipse(115, 100, 5, 5);
    //ball
    println("Ball appears when key pressed");
    fill(#FCAD0D);
    ellipse(190, 180, 20, 20);
    //mouth
    println("Look surprised when keypressed");
    fill(#F50F0F);
    ellipse(100, 120, 5, 5);
  } else {
    //eye balls
    //println("Look straight when no keypressed");
    fill(0);
    ellipse(90, 100, 10, 10);
    ellipse(110, 100, 10, 10);
    //mouth
    //println("Look happy when no keypressed");
    fill(#F50F0F);
    arc(100, 115, 15, 10, 0, PI, CHORD);
  }
}