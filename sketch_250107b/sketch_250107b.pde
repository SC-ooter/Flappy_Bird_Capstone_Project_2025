<<<<<<< HEAD
PImage birdimg;

=======
<<<<<<< HEAD
>>>>>>> 022fd54006530d3189e4cef7e56dc660bfd45f84
int birdY = height / 2;
int birdVelocity = 0;
int gravity = 1;
int lift = -15;
int birdSize = 20;

int pipeWidth = 50;
int pipeGap = 150; 
// ArrayList<Pipe> pipes = new ArrayList<Pipe>();

=======
PImage myImage;
>>>>>>> 08c1ce0fa639ae7261ed217486d767aef7ac6102
void setup () {
  // This can be the class for the background and ig we can import our images and stuff here too.
    size(900,900);
    background (255);
<<<<<<< HEAD
  birdimg = loadImage("BIRD-removebg-preview.png");
}
=======
    myImage = loadImage(""C:\Users\sterling.cossar\OneDrive - RCSD\Flappy_Bird_Capstone_Project_2025\BIRD.jpg"");
>>>>>>> 022fd54006530d3189e4cef7e56dc660bfd45f84

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
}
<<<<<<< HEAD

class Bird {
  
}

class Pipes {

}
=======
>>>>>>> 022fd54006530d3189e4cef7e56dc660bfd45f84
