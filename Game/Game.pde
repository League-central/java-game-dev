World world;
static int windowWidth;
static int windowHeight;

void setup(){
  size(800,600);
  windowWidth = width;
  windowHeight = height;
  world = new World();
}

void draw(){
  world.draw();
  world.update();
  
}
