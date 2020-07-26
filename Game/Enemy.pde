public class Emeny extends GameObject {

  Emeny(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
  }

  void update() {
  }

  void collidedWith(GameObject other) {
    if(other.type.equals("Projectile")){
      isActive = false;
    }
  }
}
