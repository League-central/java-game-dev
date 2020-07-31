public class Spike extends Obstacle {

  Spike(double x, double y, int width, int height) {
    super(x, y, width, height);
type = "Spike";
    isAffectedByGravity = false;
setImage("SMjiINlngj.jpg");

}

  void update() {
   x+=velocity.x;
y+=velocity.y;
 
}

  void collidedWith(GameObject other) {
  }
}
