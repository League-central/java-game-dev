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
     obstacles.add(new Button(2000, -200, 40, 30,new Obstacle(2200, 0, 200, 30),(1 * 1000)));
     obstacles.add(new Obstacle(2500, -1000, 80, 900));
     obstacles.add(new Obstacle(3200, 0, 80, 30));
     obstacles.add(new Obstacle(4200, 200, 80, 30));
     obstacles.add(new Obstacle(5200, 200, 40, 30));
     obstacles.add(new Obstacle(5400, 200, 40, 30));
     obstacles.add(new Obstacle(5600, 200, 40, 30));
     obstacles.add(new Obstacle(5800, 200, 40, 30));
     obstacles.add(new Obstacle(6000, 200, 100, 30));
     obstacles.add(new Obstacle(6400, 200, 60, 30));
     obstacles.add(new Obstacle(7400, 200, 200, 30));
     obstacles.add(new Goal(8000, 200, 120, 30));
    //enemies.add(new Enemy(300, 100, 40, 40));
  }
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
