public class Enemy extends GameObject {

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
   
   
  }

  void update() {
      image=loadImage(" lit.png");
    image.resize(width,height);
    
  }

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
