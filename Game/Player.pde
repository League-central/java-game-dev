public class Player extends GameObject {
  double speedLimit = 8;
  double jumpStrength = 8;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  boolean canJump = true;
  Player(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Player";
    isAffectedByGravity = true;
    isAffectedByDrag = true;
    drawX = x;
    drawY = y;
  }

  void update() {
    dx = x - drawX;
    dy = y - drawY;
    move();
  }

  void move() {
    applyDrag();
    if (up && !isAffectedByGravity) {
      addVelocity(0, -1);
    } else if (up && canJump) {
      setVelocity(velocity.x, -jumpStrength);
      canJump = false;
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
    if (isAffectedByGravity && Math.abs(velocity.x) > speedLimit) {
      setVelocity(speedLimit*Math.signum(velocity.x), velocity.y);
    } else if (!isAffectedByGravity && velocity.getMagnitude() > speedLimit) {
      Vector norm = velocity.getNormalized();
      velocity = new Vector(norm.x * speedLimit, norm.y * speedLimit);
    }
    if (!willCollideAt(x+velocity.x, y+velocity.y)) {
      x += velocity.x;
      y += velocity.y;
    } else if (!willCollideAt(x+velocity.x, y)) {
      x += velocity.x;
      velocity.y*=0.2;
      if (velocity.y > 0) {
        canJump = true;
      }
    } else if (!willCollideAt(x, y+velocity.y)) {
      y += velocity.y;
      velocity.x*=0.2;
    }
  }

  void applyDrag() {
    double xDrag = (left || right) ? 1 : 1-drag;
    double yDrag = (up || down || isAffectedByGravity) ? 1 : 1-drag;
    setVelocity(velocity.x*xDrag, velocity.y*yDrag);
  }

  boolean willCollideAt(double x, double y) {
    GameObject check = new CollisionCheck(x, y, width, height);
    GameObject hit = world.getCollisionWith(check, world.obstacles);
    if (hit != null) {
      if (hit.type.equals("Enemy")) {
        x = 20;
        y = 20;
      }
      return true;
    }
    return false;
  }

  void collidedWith(GameObject other) {
  }
}
