  public class World {
  Player player;
  double gravity = 0.2;
  int level = 1;
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();
  ArrayList<GameObject> projectiles = new ArrayList<GameObject>();
  ArrayList<GameObject> portals = new ArrayList<GameObject>();


  World() {

    createLevelOne ();
  }

  void createLevelOne () {
    
    level=1;
    
    player = new Player(50, 700, 20, 20);

    obstacles.add(new Obstacle(20, 750, 150, 30));
    obstacles.add(new Obstacle(700, 680, 150, 30));
    obstacles.add(new Obstacle(500, 620, 150, 30));
    obstacles.add(new Obstacle(200, 570, 150, 30));
    obstacles.add(new Obstacle(1, 520, 150, 30));
    obstacles.add(new Obstacle(200, 470, 150, 30));
    obstacles.add(new Obstacle(450, 470, 150, 30));
    obstacles.add(new Obstacle(300, 390, 150, 40));
    obstacles.add(new Obstacle(700, 450, 150, 30));
    obstacles.add(new Obstacle(700, 390, 150, 30));
    obstacles.add(new Obstacle(1, 340, 150, 30));
    obstacles.add(new Obstacle(1, 280, 150, 30));
    obstacles.add(new Obstacle(1, 220, 150, 30));
    obstacles.add(new Obstacle(1, 160, 150, 30));
    obstacles.add(new Obstacle(1, 100, 150, 30));
    obstacles.add(new Obstacle(700, 160, 150, 30));
    obstacles.add(new Obstacle(400, 160, 150, 30));

    enemies.add(new Enemy(200, 700, 40, 40));

    portals.add(new Portal(740, 95, 50, 60));
  } 

  void createLevelTwo () {

    level=2;

    obstacles.clear();

    enemies.clear();

    portals.clear();

    player = new Player(50, 700, 20, 20);
    
    player.speedLimit=4;
    
    player.isAffectedByGravity=false;  
    
    portals.add(new Portal(505, 225, 50, 60));

    obstacles.add(new Spike(20, 750, 120, 20));
    
    obstacles.add(new Spike(20, 450, 20, 300));
  
    obstacles.add(new Spike(120, 550, 20, 200));

    obstacles.add(new Spike(120, 550, 200, 20));

    obstacles.add(new Spike(-10, 450, 230, 20));

    obstacles.add(new Spike(200, 250, 20, 200));

    obstacles.add(new Spike(300, 250, 20, 300));
    
    obstacles.add(new Spike(150, 200, 250, 20));

    obstacles.add(new Spike(400, 200, 20, 420));

    obstacles.add(new Spike(200, 600, 220, 20));
    
    obstacles.add(new Spike(140, 650, 220, 20));

    obstacles.add(new Spike(140, 200, 20, 200));

    obstacles.add(new Spike(90, 250, 20, 200));

    obstacles.add(new Spike(40, 200, 20, 200));
    
    obstacles.add(new Spike(-10, 100, 20, 350));
    
    obstacles.add(new Spike(-10, 100, 650, 20));
    
    obstacles.add(new Spike(60, 200, 80, 20));
    
    obstacles.add(new Spike(480, 200, 20, 450));
    
    obstacles.add(new Spike(500, 200, 80, 20));
    
    obstacles.add(new Spike(250, 650, 250, 20));
  
    obstacles.add(new Spike(560, 200, 20, 400));
    
    obstacles.add(new Spike(500, 650, 150, 20));
    
    obstacles.add(new Spike(630, 100, 20, 550));

}


  void update() {
    player.updateObject();
    for (GameObject enemy : enemies) {
      enemy.updateObject();
    }
    for (GameObject obstacle : obstacles) {
      obstacle.updateObject();
    }
    for (GameObject portal : portals) {
      portal.updateObject();
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

    for (GameObject portal : portals) {
      portal.draw();
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
    for (int i = portals.size()-1; i >= 0; i--) {
      if (portals.get(i).isActive == false) {
        portals.remove(i);
      }
    }
    for (int i = projectiles.size()-1; i >= 0; i--) {
      if (projectiles.get(i).isActive == false) {
        projectiles.remove(i);
      }
    }
  }

  public boolean checkCollisionWithAny(GameObject object) {
    if (checkCollisionWith(object, enemies) || checkCollisionWith(object, obstacles) || checkCollisionWith(object, projectiles ) || checkCollisionWith(object, projectiles)) {
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
