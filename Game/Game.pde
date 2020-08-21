World world;
double dx = 0;
double dy = 0;
double parallaxX = 0;//
double parallaxY = 0;
PImage backgroundImage;
static int windowWidth;
static int windowHeight;
boolean displayDebugColliders = false;
boolean jumpCheatActivated = false;
boolean isEnd =  false;

void setup() {
  size(1600, 800);
  windowWidth = width;
  windowHeight = height;

  backgroundImage = loadImage("background5.png");
  backgroundImage.resize(windowWidth, windowHeight);
  world = new World();
}

void draw() {
  if (!isEnd) {
    parallaxX = -((dx/8) % 800);
    parallaxY = -((dy/8) % 600);
    if (backgroundImage != null) {//
      image(backgroundImage, (int)parallaxX, (int)parallaxY);
      image(backgroundImage, (int)parallaxX + width, (int)parallaxY + height);
      image(backgroundImage, (int)parallaxX + width, (int)parallaxY - height);
      image(backgroundImage, (int)parallaxX - width, (int)parallaxY + height);
      image(backgroundImage, (int)parallaxX, (int)parallaxY - height);
      image(backgroundImage, (int)parallaxX, (int)parallaxY + height);
      image(backgroundImage, (int)parallaxX - width, (int)parallaxY);
      image(backgroundImage, (int)parallaxX + width, (int)parallaxY);
      image(backgroundImage, (int)parallaxX - width, (int)parallaxY - height);
    } else {
      background(255, 255, 255);
    }
    world.draw();
    world.update();
  } else {
    background(0, 0, 0);
    textSize(32);
    fill(#00FF1F);
    text("Game Over! You Win!", width/2 - 180, height/4);
    textSize(28);
    text("Hit r to restart.", width/2 - 160, height/4 + 100);
  }
}

void keyPressed() {
  //println(keyCode);
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
  //Z key cheat code
  if (keyCode == 90) {
    if (!jumpCheatActivated) {
      world.player.speedLimit = 11;
      world.player.jumpStrength = 11;
      jumpCheatActivated = true;
      world.player.maxJumps = 1000;
    } else {
      world.player.speedLimit = world.player.speedStart;
      world.player.jumpStrength = world.player.jumpStart;
      jumpCheatActivated = false;
      world.player.maxJumps = 2;
    }
  }
  //R3 key
  if (keyCode == 82) {
    world.player.x = world.player.startX;
    world.player.y = world.player.startY;
    isEnd = false;
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
