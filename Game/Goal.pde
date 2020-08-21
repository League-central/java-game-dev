public class Goal extends Obstacle {

  Goal(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Goal";
    isAffectedByGravity = false;
    objColor = color(#DEFF0D);
  }

  void collidedWith(GameObject other) {
  }
}
