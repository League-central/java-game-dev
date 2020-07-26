public class Player extends GameObject {
  double speedLimit = 6;
  Player(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Player";
  }

  void update() {
    move();
  }
  
  void move(){
    if(velocity.getMagnitude() > speedLimit){
      Vector norm = velocity.getNormalized();
      velocity = new Vector(norm.x * speedLimit, norm.y * speedLimit);
    }
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
  
  
}
