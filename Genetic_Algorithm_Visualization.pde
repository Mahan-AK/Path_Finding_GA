Population test;
PVector goal  = new PVector(400, 10);
boolean train = false;


void setup() {
  size(800, 800); //size of the window
  frameRate(800);//increase this to make the dots go faster
  test = new Population(1000);//create a new population with 1000 members
}

void mouseReleased() {
  if (mouseX>15 && mouseX <15+30 && mouseY>15 && mouseY <15+30) train = !train;
}

void draw() {
  background(255);
  noStroke();
  if (train) fill(255, 0, 0);
  else fill(0, 255, 0);
  ellipse(30, 30, 30, 30);
  
  if (!train) {
    fill(255, 0, 0);
    ellipse(goal.x, goal.y, 10, 10);
  
    //draw obstacle(s)
    fill(0, 0, 255);
    rect(0, 300, 600, 10);
    rect(200, 500, 600, 10);      

    if (test.allDotsDead()) {
      
      //genetic algorithm
      test.calculateFitness();
      test.naturalSelection();
      test.mutateDemBabies();
    } else {
      //if any of the dots are still alive then update and then show them
     
      
      test.update();
      test.show();
    }
  } else {
    
    if (test.allDotsDead()) {
      //genetic algorithm
      test.calculateFitness();
      test.naturalSelection();
      test.mutateDemBabies();
    } else {
      //if any of the dots are still alive then update and then show them

      test.update();
    }
  }
}
