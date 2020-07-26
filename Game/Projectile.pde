public class Projectile extends GameObject {
  Projectile(double x, double y, int width, int height, Vector velocity) {
    super(x, y, width, height);
    type = "Projectile";
    this.velocity = velocity;
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
