public class GameObject {
  PImage image;
  color objColor = color(100, 0, 0);
  int x;
  int y;
  int width;
  int height;
  GameObject(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  void draw() {
    if (image != null) {
      image(image, x, y);
    } else {
      fill(objColor);
      rect(x, y, width, height);
    }
  }
  
  void update(){
    
  }

  void setColor(int r, int g, int b) {
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);
    
    objColor = color(r, g, b);
  }
  
  void setImage(String imageName) {
    image = loadImage(imageName);
    image.resize(width, height);
  }
}
