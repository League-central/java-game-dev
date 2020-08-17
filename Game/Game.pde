World world;
double dx = 0;
double dy = 0;
PImage backgroundImage;
static int windowWidth;
static int windowHeight;
boolean displayDebugColliders = false;

void setup() {
  size(800, 600);
  windowWidth = width;
  windowHeight = height;

  backgroundImage = loadImage("landscape.png");
  backgroundImage.resize(width, height);
  world = new World();
}

void draw() {
  if (backgroundImage != null) {
    background(backgroundImage);
  } else {
    background(255, 255, 255);
  }
  world.draw();
  world.update();
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
