World world;
PImage backgroundImage;
static int windowWidth;
static int windowHeight;
boolean displayDebugColliders = false;
static boolean gameOver = false;
 PImage heartImage;
 
  
void setup() {
  size(800, 600);
  windowWidth = width;
  windowHeight = height;
  backgroundImage = loadImage("world.jpeg");
  backgroundImage.resize(width,height);
  heartImage = loadImage("heart.png");
  heartImage.resize(15,15);
  world = new World();

 
}
;
void draw() {
  if (backgroundImage != null) {
    background(backgroundImage);
  } else {
    background(66, 81, 234);
  }
  world.draw();
  world.update();


for(int i=0; i < world.player.lives; i++){
 image(heartImage, i*17, 7);
}
}

void keyPressed() {
  println(keyCode);
  // W Key
  if (keyCode == 87) {
    world.player.up = true;
  }
  // D key
  if (keyCode == 68) {
    world.player.right = true;
  }
  // S key
  if (keyCode == 83) {
    world.player.down = true;
  }
  // A key
  if (keyCode == 65) {
    world.player.left = true;
  }
  // P key
  if (keyCode == 80) {
    displayDebugColliders = !displayDebugColliders;
  }
}

void keyReleased() {
  // W Key
  if (keyCode == 87) {
    world.player.up = false;
  }
  // D key
  if (keyCode == 68) {
    world.player.right = false;
  }
  // S key
  if (keyCode == 83) {
    world.player.down = false;
  }
  // A key
  if (keyCode == 65) {
    world.player.left = false;
  }

}
