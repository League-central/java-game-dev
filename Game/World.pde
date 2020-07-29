public class World {
  Player player;
  double gravity = 0.2;
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();
  ArrayList<GameObject> projectiles = new ArrayList<GameObject>();

  World() {
    player = new Player(50, 50, 100, 100);
    player.setImage("cat.png");
   
   projectiles.add( new Projectile(20, 400, 400, 30, new Vector(-5, 0)));
   projectiles.add( new Projectile(500, 350, 240, 30, new Vector(-5, 0)));
   projectiles.add( new Projectile(250, 200, 340, 30, new Vector(-5, 0)));
  enemies.add(new Enemy (width, 10 , 20 , 20 ));
  enemies.add(new Enemy (width, height-20, 20, 20));
  }

  void update() {
    player.updateObject();
    for (GameObject enemy : enemies) {
      enemy.updateObject();
    }
    for (GameObject obstacle : obstacles) {

      obstacle.updateObject();
    }
    for (GameObject projectile : projectiles) {
      projectile.updateObject();
          if (projectile.x + projectile.width <= 0){
            
             //if it is, remove it
          
              //create a new one 
    
               projectile.x = width;
               projectile.y = (int) random(height-player.height);
        }
      
    }
   //checkPlayerCollisionWithProjectiles();
    
   purgeObjects();
  }

  void draw() {
    player.draw();
    for (GameObject enemy : enemies) {
      enemy.draw();
    }
    for (GameObject obstacle : obstacles) {
      obstacle.draw();
    }
    for (GameObject projectile : projectiles) {
      projectile.draw();
    }
    if(Game.gameOver == true){
      fill(0,0,0);
     textSize(50);
      text("Game Over", 50, 50);
    }
  }

  void purgeObjects() {
    for (int i = enemies.size()-1; i >= 0; i--) {
      if (enemies.get(i).isActive == false) {
        enemies.remove(i);
      }
    }
    for (int i = obstacles.size()-1; i >= 0; i--) {
      if (obstacles.get(i).isActive == false) {
        obstacles.remove(i);
      }
    }
    for (int i = projectiles.size()-1; i >= 0; i--) {
      if (projectiles.get(i).isActive == false) {
        projectiles.remove(i);
      }
    }
  }

  public boolean checkCollisionWithAny(GameObject object) {
    if (checkCollisionWith(object, enemies) || checkCollisionWith(object, obstacles) || checkCollisionWith(object, projectiles)) {
      return true;
    }
    return false;
  }

  public boolean checkCollisionWith(GameObject object, ArrayList<GameObject> list) {
    for (GameObject listObj : list) {
      if (checkCollisionBetween(object, listObj)) {
     
        return true;
      }
    }
    return false;
  }
  
  public GameObject getCollisionWith(GameObject object, ArrayList<GameObject> list) {
    for (GameObject listObj : list) {
      if (checkCollisionBetween(object, listObj)) {
     
        return listObj;
      }
    }
    return null;
  }
  
  public boolean checkPlayerCollisionWithProjectiles() {
    for (GameObject listObj : projectiles) {
      if (checkCollisionBetween(player, listObj)) {
        listObj.x = width;
        listObj.y = (int) random(height-player.height);
        player.lives--;
        println("lives " + player.lives);
       
        
        return true;
      }
    }
    return false;
  }

  public boolean checkCollisionBetween(GameObject a, GameObject b) {
    if (a.x + a.width >= b.x && a.x <= b.x + b.width && a.y + a.height >= b.y && a.y < b.y + b.height) {
      a.collidedWith(b);
      b.collidedWith(a);
      return true;
    }

    return false;
  }

  Vector calculateVector(GameObject from, GameObject to) {
    return new Vector(to.x - from.x, to.y - from.y);
  }

  Vector calculateNormalizedVector(GameObject from, GameObject to) {
    return new Vector(to.x - from.x, to.y - from.y).getNormalized();
  }
}
