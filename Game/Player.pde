
public class Player extends GameObject {
  double speedLimit = 6;
  double jumpStrength = 5;
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
  }

  void update() {
    if (hasGoneOffScreen()) {
      x=45;
      y=700;
    }

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
    GameObject hit2 = world.getCollisionWith(check, world.portals);

    if (hit != null) {
      if (hit.type.equals("Spike")) {
        this.x = 50;
        this.y = 700;
      }
      return true;
    }  
    if (hit2 != null) {
      if (hit2.type.equals("Portal")) {
        if (world.level==1) {
          world.createLevelTwo();
        } else {
          isEnd = true;
        }
      }
    }
    return false;
  }


  void collidedWith(GameObject other) {
    if (other.type.equals("Portal")) {
      world.createLevelTwo();
    }
  }
}
