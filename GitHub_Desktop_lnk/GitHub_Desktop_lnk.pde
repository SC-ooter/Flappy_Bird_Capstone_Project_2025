PImage birdimg;
int birdY;
int birdVelocity = 0;
int gravity = 1;
int lift = -15;
int birdSize = 20;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
int frameCounter = 0;

void setup () {
  size(900, 900);
  birdY = height / 2;
  birdimg = loadImage("BIRD-removebg-preview.png");
}

void draw() {
  background(255);

  // Sky (blue rectangle)
  fill(95, 190, 255);
  rect(0, 0, width, height);

  // Ground (green rectangle)
  fill(0, 215, 0);
  rect(0, height - 100, width, 100);

  // Update bird's position
  birdVelocity += gravity;
  birdY += birdVelocity;

  // Prevent bird from falling below ground
  if (birdY > height - 100 - birdSize) {
    birdY = height - 100 - birdSize;
    birdVelocity = 0;
  }

  // Prevent bird from flying above screen
  if (birdY < 0) {
    birdY = 0;
    birdVelocity = 0;
  }

  // Draw bird
  image(birdimg, width / 6, birdY, 100, 100);

  // Pipe management
  if (frameCounter % 100 == 0) {
    pipes.add(new Pipe(width, random(200, height - 400), 250)); // Increased gap
  }
  frameCounter++;

  // Update and display pipes
  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipe p = pipes.get(i);
    p.update();
    p.show();

    // Remove pipes that are off-screen
    if (p.offScreen()) {
      pipes.remove(i);
    }

    // Check for collisions
    if (p.hits(birdY, birdSize)) {
      println("Game Over");
      noLoop(); // Stop the game
    }
  }
}

// To make the bird jump
void keyPressed() {
  if (key == ' ' || key == 'w' || key == 'W') {
    birdVelocity = lift; // Make bird jump
  }
}

// Pipe Class
class Pipe {
  float x, top, bottom, width;
  float speed = 5;

  Pipe(float startX, float topHeight, float gapHeight) {
    x = startX;
    top = topHeight;
    bottom = top + gapHeight;
    width = 50;
  }

  void update() {
    x -= speed; // Move pipe to the left
  }

  void show() {
    fill(0, 255, 0);
    rect(x, 0, width, top); // Top pipe
    rect(x, bottom, width, height - bottom); // Bottom pipe
  }

  boolean offScreen() {
    return x + width < 0; // Check if the pipe is off-screen
  }

  boolean hits(int birdY, int birdSize) {
    // Check if the bird is within the horizontal range of the pipe
    boolean horizontalCollision = (birdY + birdSize > top && birdY < bottom && width / 6 + 100 > x && width / 6 < x + width);

    // Check if the bird hits the top pipe or bottom pipe
    if (horizontalCollision) {
      if (birdY < top || birdY + birdSize > bottom) {
        return true; // Bird hits the pipe (either top or bottom)
      }
    }
    return false; // No collision
  }
}
