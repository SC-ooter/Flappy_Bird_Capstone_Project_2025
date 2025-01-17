PImage birdimg;
PImage groundimg;
float birdY;
float birdX;
float birdVelocity = 0;
float gravity = 1;
float lift = -15;
float birdSize = 20;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
float frameCounter = 0;
int score = 0;
boolean gameOver = false;

void setup () {
  size(900, 900);
  birdY = height / 2;
  birdimg = loadImage("BIRD-removebg-preview.png");
  groundimg = loadImage("FlappyBG.png");
  frameRate(60);
}

void draw() {
  background(255);
  image(groundimg, 0, 0, 900, 900);

  // // Sky (blue rectangle)
  // fill(95, 190, 255);
  // rect(0, 0, width, height);

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
    noLoop();   
    gameOver = true;
    fill(255, 0, 0);
    textSize(40);
    text("\tGAME OVER\nPRESS SPACE OR W TO RESTART", 100, 100 );
    //Added Speed = 4 so that the player restarts as 4 rather than wherever they ended
    speed = 4;
  }

  // Prevent bird from flying above screen   
  if (birdY < 0) {
   birdY = 0;
   birdVelocity = 0;
  }

  // Draw bird
  image(birdimg, width / 6, birdY, 50, 40);

  // Pipe generation
  if (frameCounter % 100 == 0) {
    pipes.add(new Pipe(width, random(255, height - 300), 50, 200)); // Fix pipes generating below the ground
  }
  frameCounter++;

  // Update and display pipes
  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipe p = pipes.get(i);
    p.update();
    p.show();

    if (!p.scored && p.x + p.w < width / 6) {
      score++;
      p.scored = true;
    }

    // Remove pipes that are off-screen
    if (p.offScreen()) {
      pipes.remove(i);
    } 

    // Check for collisions
    if (p.collides(width / 6, birdY, birdSize)) {
      gameOver = true;
      noLoop(); // Stop the game
      fill(255, 0, 0);
      textSize(40);
      text("\tGAME OVER\nPRESS SPACE OR W TO RESTART", 100, 100 );
    } 

    // Display score
    fill(255);
    textSize(30);
    text("Score " + score, 20, 40);
  }
}

// To make the bird jump
void keyPressed() {
  if (key == ' ' || key == 'w' || key == 'W') {
    if (gameOver) {
      gameOver = false;
      birdY = height / 2;
      birdVelocity = 0;
      score = 0;
      pipes.clear();
      frameCounter = 0;
      loop();

    } else {
    birdVelocity = lift; // Make bird jump
    }
  } 
}

// Pipe Class
class Pipe {
  float x, y, w, gap;
  boolean scored = false; // Tracking the score 

  Pipe(float startX, float startY, float pipeWidth, float gapHeight) {
    x = startX;
    y = startY;
    w = pipeWidth;
    gap = gapHeight;
  }

  void update() { // fix the speed up and keep gaps between pipes consistent 
    x -= 4; // Move pipe to the left
    if (score >= 20) {
      x -= 4.5;
    }
  }

  void show() {
    fill(0, 255, 0);
    rect(x, 0, w, y); // Top pipe
    rect(x, y + gap, w, height - y - gap); // Bottom pipe
  }

  boolean offScreen() {
    return x + width < 0; // Check if the pipe is off-screen
  }

  boolean collides(float birdX, float birdY, float birdSize) {    
    // Check if the bird hits the top pipe or bottom pipe
    if (birdX + birdSize > x && birdX < x + w) {
      if (birdY < y || birdY + birdSize > y + gap) {
        return true;
      }
    }
    return false; // No collision
  }
}