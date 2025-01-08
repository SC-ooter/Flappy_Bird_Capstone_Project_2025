PImage myImage;
void setup () {
  // This can be the class for the background and ig we can import our images and stuff here too.
    size(900,900);
    background (255);
    myImage = loadImage(""C:\Users\sterling.cossar\OneDrive - RCSD\Flappy_Bird_Capstone_Project_2025\BIRD.jpg"");

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
  image(myImage,10,10);
}
