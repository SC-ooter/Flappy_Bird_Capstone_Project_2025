
PImage birdimg;


int birdY = height / 2;
int birdVelocity = 0;
int gravity = 1;
int lift = -15;
int birdSize = 20;

int pipeWidth = 50;
int pipeGap = 150; 
// ArrayList<Pipe> pipes = new ArrayList<Pipe>();


PImage myImage;

void setup () {
  // This can be the class for the background and ig we can import our images and stuff here too.
    size(900,900);
    background (255);
    birdimg = loadImage("BIRD-removebg-preview.png");
}


void draw() {
  background(255);
  //draws blue rect
  rect(0,0,1000,600);
  //green
  fill(0,215,0);
  //draws green rect
  rect(width/2-100,0,width/6,500);
  //blue 
  fill(95,190,255);
  image(birdimg, width/6, height/2, width/8, height/8);
  
  // Bird position 
  birdVelocity += gravity;
  birdY = height - birdSize;
  birdVelocity = 0;
  
  // Boundary control
  if (birdY > height - birdSize) {
    birdY = height - birdSize;
    birdVelocity = 0;
  }
}

// To make the bird jump
void keyPressed() {
  if (key == ' ' || key == 'w' || key == 'W') {
    birdVelocity = lift;
  }
}


class Bird {
  double x, y, velocity, size;
  PImage img;
  
  Bird(double startX, double startY, double birdSize, PImage birdImg) {
    x = startX;
    y = startY;
    velocity = 0;
    size = birdSize;
    img = birdImg;
  }
  
  void update() {
    velocity += gravity;
    y += velocity;
    if (y > height - size) {
      y = height - size;
      velocity = 0;
    }
  }
  
  void jump() {
    velocity = lift;
  }
}
  
class Pipes {
  }
