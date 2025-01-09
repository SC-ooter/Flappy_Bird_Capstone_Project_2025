PImage birdimg;
int birdY = height / 2;
int birdVelocity = 0;
int gravity = 1;
int lift = -15;
int birdSize = 20;
int pipeWidth = 50;
int pipeGap = 150; 
ArrayList<Pipes> pipes = new ArrayList<Pipes>();

Bird bird;

void setup() {
  size(900, 900);
  background(255);
  birdimg = loadImage("BIRD-removebg-preview.png");
  
  // Initialize Bird object
  bird = new Bird(width / 6, height / 2, birdSize, birdimg);
  
  // Initialize some pipes
  pipes.add(new Pipes(width, random(height / 2, height - pipeGap), pipeWidth, pipeGap));
}

void draw() {
  background(255);
  
  // Draw sky (blue)
  fill(95, 190, 255);
  rect(0, 0, width, height);
  
  // Draw ground (green)
  fill(0, 215, 0);
  rect(0, height - 100, width, 100);

  // Update and display the bird
  bird.update();
  image(bird.img, bird.x, bird.y, bird.size, bird.size);

  // Move and draw pipes
  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipes p = pipes.get(i);
    p.update();
    p.show();

    // Remove pipes if they are off-screen
    if (p.offScreen()) {
      pipes.remove(i);
    }
  }

  // Check if new pipes need to be added
  if (frameCount % 60 == 0) {
    pipes.add(new Pipes(width, random(height / 2, height - pipeGap), pipeWidth, pipeGap));
  }
}

void keyPressed() {
  if (key == ' ' || key == 'w' || key == 'W') {
    bird.jump();
  }
}

class Bird {
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

    if (y > height - size - 100) {  // Collision with the ground
      y = height - size - 100;
      velocity = 0;
    }
  }
  
  void jump() {
    velocity = lift;
  }
}

class Pipes {
  float x, y, w, gap;
  
  Pipes(float startX, float startY, float pipeWidth, float pipeGap) {
    x = startX;
    y = startY;
    w = pipeWidth;
    gap = pipeGap;
  }
  
  void update() {
    x -= 5;  // Move pipes left
  }

  void show() {
    fill(0, 255, 0);
    // Top pipe
    rect(x, 0, w, y);
    // Bottom pipe
    rect(x, y + gap, w, height - y - gap);
  }

  boolean offScreen() {
    return x < -w;
  }
}
