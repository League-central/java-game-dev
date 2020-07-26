public abstract class GameObject {  
  PImage image;
  Vector velocity;
  String type;
  color objColor = color(100, 0, 0);
  double x;
  double y;
  double drag = 0.2;
  boolean isActive = true;
  boolean isAffectedByGravity = true;
  boolean isAffectedByDrag = false;
  int width;
  int height;

  GameObject(double x, double y, int width, int height) {
    type = "GameObject";
    this.velocity = new Vector(0, 0);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  GameObject(double x, double y, int width, int height, String imageName) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    setImage(imageName);
  }

  void draw() {
    if (image != null) {
      image(image, (int)x, (int)y);
    } else {
      stroke(0,0,0);
      fill(objColor);
      rect((int)x, (int)y, width, height);
    }
    
    if(displayDebugColliders){
      stroke(255,0,0);
      noFill();
      rect((int)x, (int)y, width, height);
    }
  }

  void updateObject() {
    applyGravity();
    update();
    if(hasGoneOffScreen()){
      isActive = false;
    }
  }
  
  void applyGravity() {
    if (isAffectedByGravity) {
      addVelocity(0, world.gravity);
    }
  }

  abstract void update();

  abstract void collidedWith(GameObject other);

  void setColor(int r, int g, int b) {
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);

    objColor = color(r, g, b);
  }

  void setImage(String imageName) {
    image = loadImage(imageName);
    image.resize(width, height);
  }

  public boolean hasGoneOffScreen() {
    if (x > Game.windowWidth || x + this.width < 0 || y > Game.windowHeight || y + this.height < 0) {
      return true;
    }
    return false;
  }

  void setVelocity(Vector velocity) {
    this.velocity = velocity;
  }

  void setVelocity(double x, double y) {
    this.velocity = new Vector(x, y);
  }

  void addVelocity(Vector velocity) {
    this.velocity = new Vector(this.velocity.x + velocity.x, this.velocity.y + velocity.y);
  }

  void addVelocity(double x, double y) {
    this.velocity = new Vector(this.velocity.x + x, this.velocity.y + y);
  }
}
