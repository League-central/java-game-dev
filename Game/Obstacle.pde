public class Obstacle extends GameObject {

  Obstacle(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Obstacle";
    isAffectedByGravity = false;
    }
    
    
    void setImage(String png) {
    image = loadImage(png);
    image.resize(width, height);
    
    }
 
  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other){
  }
  
  
}
//if(hit!=null){

//  if(hit.type.equals("enemy")){
  
//    GameObject hit=
//    world.getCollisionWith(check,world.obstacle);
//  }
    
//}
//}
