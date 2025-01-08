int birdY = height / 2;
int birdVelocity = 0;
int gravity = 1;
int lift = -15;
int birdSize = 20;

int pipeWidth = 50;
int pipeGap = 150; 
// ArrayList<Pipe> pipes = new ArrayList<Pipe>();

void setup () {
  // This can be the class for the background and ig we can import our images and stuff here too.
    size(900,900);
    background (255);
}
void draw() {
  background(255);
  //draws blue rect
  rect(0,0,1000,600);
  //green
  fill(0,215,0);
  //draws green rect
  rect(width/2-100,0,width/4,500);
  //blue 
  fill(95,190,255);
}
