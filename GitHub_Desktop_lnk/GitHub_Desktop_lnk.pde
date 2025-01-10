PImage birdimg;
int birdY;
int birdVelocity = 0;
int gravity = 1;
int lift = -15;
int birdSize = 20;
//int pipeWidth = 50;
//int pipeGap = 150; 
// ArrayList<Pipe> pipes = new ArrayList<Pipe>();

void setup () {
  // This can be the class for the background and ig we can import our images and stuff here too.
    size(900,900);
    birdY = height / 2;
    birdimg = loadImage("BIRD-removebg-preview.png");
    // bird = new Bird(birdimg, width/6, height/2, 20, 20);
}

void draw() {
  
  background(255);
  // Blue sky
  fill(95, 190, 255);
  rect(0,0, width, height);
  
  // Green ground
  fill(0, 215, 0);
  rect(0 , height - 100, width, 100);

  
  // Updating bird's position 
  birdVelocity += gravity;
  birdY += birdVelocity;
  
  // Boundary control so the bird does not go below the screen
  if (birdY > height - 100 - birdSize) {
    birdY = height - 100 - birdSize;
    birdVelocity = 0;
  }
  
  image(birdimg, width / 6, birdY, 100, 100 );
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
  
