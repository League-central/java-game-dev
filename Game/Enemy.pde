public class Enemy extends GameObject {

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
  }

  void update() {
  if (frameCount %  85 ==0) {
   int rand = (int)random(0,10);
   if(rand > 5){
    Obstacle obstacle = new Obstacle(x,y, 50,30);
world.obstacles.add(obstacle);
obstacle.addVelocity(-2, 0);
    }
else{
  Obstacle obstacle = new Spike ( x,y, 50, 30);
  world.obstacles.add(obstacle);
  obstacle.addVelocity(-2, 0);
}
  }
  }
  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
