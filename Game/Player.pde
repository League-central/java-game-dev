public class Player extends GameObject {
  double speedLimit = 6;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  Player(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Player";
  }

  void update() {
    move();
  }
  
  void move(){
    if(up){
      addVelocity(0, -1);
    }
    if(down){
      addVelocity(0, 1);
    }
    if(left){
      addVelocity(-1, 0);
    }
    if(right){
      addVelocity(1, 0);
    }
    if(velocity.getMagnitude() > speedLimit){
      Vector norm = velocity.getNormalized();
      velocity = new Vector(norm.x * speedLimit, norm.y * speedLimit);
    }
    x += velocity.x;
    y += velocity.y;
    setVelocity(velocity.x*0.7, velocity.y*0.7);
  }

  void collidedWith(GameObject other) {
  }
  
  
}
