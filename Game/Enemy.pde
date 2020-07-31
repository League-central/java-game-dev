public class Enemy extends GameObject {

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
    setImage("alien.png");
    image.resize(width, height);
  }

  void update() {
    if(frameCount%30==0){
      world.projectiles.add(new Projectile(x,y,20,10,new Vector(10,0)));
    }
  }

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
