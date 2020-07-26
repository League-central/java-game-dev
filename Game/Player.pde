public class Player extends GameObject {
  double speedLimit = 8;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  Player(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Player";
    isAffectedByGravity = false;
  }

  void update() {
    move();
  }

  void move() {
    if (up && !isAffectedByGravity) {
      addVelocity(0, -1);
    } else if (up) {
      setVelocity(0, -1);
    }
    if (down) {
      addVelocity(0, 1);
    }
    if (left) {
      addVelocity(-1, 0);
    }
    if (right) {
      addVelocity(1, 0);
    }
    if (velocity.getMagnitude() > speedLimit) {
      Vector norm = velocity.getNormalized();
      velocity = new Vector(norm.x * speedLimit, norm.y * speedLimit);
    }
    x += velocity.x;
    y += velocity.y;
    setVelocity(velocity.x*0.9, velocity.y*0.9);
  }

  void collidedWith(GameObject other) {
  }
}
