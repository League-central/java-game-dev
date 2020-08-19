public class World {
  Player player;
  Checkpoint checkpoint;
  double gravity = 0.2;
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();
  ArrayList<GameObject> projectiles = new ArrayList<GameObject>();


  World() {
    player = new Player(50, 50, 20, 20);
    checkpoint= new Checkpoint(500,50,40,80);
    checkpoint.objColor=color(0,100,255);
    obstacles.add(new Obstacle(20, 400, 400, 30));
    enemies.add(new Enemy(250, 100, 40, 40));
    obstacles.add(new Obstacle(500, 250, 100, 30));
    
  }
void createlevel2(){
  enemies.clear();
  obstacles.clear();
  projectiles.clear();
  player = new Player(50, 50, 20, 20);
  checkpoint= new Checkpoint(200,50,40,80);
    checkpoint.objColor=color(0,100,255);
    obstacles.add(new Obstacle(20, 400, 400, 30));
    enemies.add(new Enemy(500, 200, 40, 40));
}
  void update() {
    checkpoint.updateObject();
    player.updateObject();
    for (GameObject enemy : enemies) {
      enemy.updateObject();
    }
    for (GameObject obstacle : obstacles) {
      obstacle.updateObject();
    }
    for (GameObject projectile : projectiles) {
      projectile.updateObject();
    }
    purgeObjects();
    
  }

  void draw() {
    checkpoint.draw();
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
