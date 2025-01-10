PImage birdimg;
int birdY;
int birdVelocity = 0;
double gravity = 1;
int lift = -15;
int birdSize = 20;
//int pipeWidth = 50;
//int pipeGap = 150; 
ArrayList<Pipes> pipes = new ArrayList<Pipes>();
int frameCounter = 0;

void setup() {
  // This can be the class for the background and ig we can import our images and stuff here too.
    size(900,900);
    birdY = height / 2;
    birdimg = loadImage("BIRD-removebg-preview.png");
    bird = new Bird(birdimg, width / 6, iheight / 2, 20, 20);
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

  if (frameCounter % 100 == 0) {
    pipes.add(new Pipes(width, random(150, height - 300), 150));
  }
  frameCounter++;

  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipes p = pipes.get(i);
    p.update();
    p.show();
    if (pipes.offScreen()) {
      pipes.remove(i);
    }
  }
}


// To make the bird jump
void keyPressed() {
  if (key == ' ' || key == 'w' || key == 'W') {
    birdVelocity = lift;
  }
}


public class Bird {
  float x, y, velocity, size;
  PImage img;
  
  Bird(float startX, float startY, float birdSize, PImage birdImg) {
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
  
public class Pipes {
  float x, top, bottom, width; 
  float speed = 5; 
  boolean scored = false; 


  Pipes(float startX, fl topHeight, double gapHeight){
    x = startX;
    top = topHeight;
    bottom = top + gapHeight;
    width = 50;
  }
  
  void update() {
    x -= speed;
  }

  void show() {
    fill (0, 255, 0);
    rect(x, 0, width, top);
    rect(x, bottom, width, height - bottom);
  }

  boolean offScreen() {
    return x + width < 0;
  }

  boolean hits() {
    if (birdY + birdSize > top && birdY < bottom && width / 6 + birdSize > x && width / 6 < x + width) {
      return true;
    }
    return false;
  }
}


