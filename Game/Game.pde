World world;
PImage backgroundImage;
static int windowWidth;
static int windowHeight;

void setup(){
  size(800,600);
  windowWidth = width;
  windowHeight = height;
  backgroundImage = null;
  world = new World();
}

void draw(){
  if(backgroundImage != null){
    background(backgroundImage);
  }
  else{
    background(255,255,255);
  }
  world.draw();
  world.update();
  
}
