public class Vector {
  double x;
  double y;
  Vector(double x, double y) {
    this.x = x;
    this.y = y;
  }

  double getMagnitude() {
    return Math.abs(Math.sqrt(x*x + y*y));
  }

  Vector getNormalized() {
    double mag = getMagnitude();
    return new Vector((x/mag), (y/mag));
  }
}
