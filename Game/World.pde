public class World {
  Player player;
  double gravity = 0.2;
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();
  ArrayList<GameObject> projectiles = new ArrayList<GameObject>();

  World() {
    player = new Player(100, 360, 20, 20);
    obstacles.add(new Obstacle(0, 400, 400, 30));
    obstacles.add(new Obstacle(600, 400, 200, 30));
    obstacles.add(new Obstacle(1000, 400, 100, 30));
     obstacles.add(new Obstacle(1400, 400, 200, 30));
     obstacles.add(new Obstacle(1800, 200, 200, 30));
     obstacles.add(new Obstacle(2000, 0, 100, 30));
     obstacles.add(new Button(2000, -200, 40, 30,new Obstacle(2200, 0, 200, 30),(2 * 1000)));
     obstacles.add(new Obstacle(3200, 0, 80, 30));
     obstacles.add(new Obstacle(2300,-10000 - 200, 80, 10000));
    //enemies.add(new Enemy(300, 100, 40, 40));
  }//wwwww
void addObstacle(GameObject go){
obstacles.add(go);
}
void removeObstacle(GameObject go){
obstacles.remove(go);
}
  void update() {
    player.updateObject();
    for (GameObject enemy : enemies) {
      enemy.updateObject();
    }
    for (int i = 0; i < obstacles.size(); i++) {
      obstacles.get(i).updateObject();
    }
    for (GameObject projectile : projectiles) {
      projectile.updateObject();
    }
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
