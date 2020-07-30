public class Food extends GameObject {
  Food(double x, double y, int width, int height ) {
    super(x, y, width, height);
    type = "Food";
   velocity=new Vector(-3,0);
    this.isAffectedByGravity = false;
    setImage("apple.jpg");
  }

  void update() {
    if (x<=0){
      x=windowWidth;
     y = (int) random(windowHeight);
      
    }
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
