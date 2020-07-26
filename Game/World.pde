public class World {
  Player player;
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();

  World() {
  }

  void update() {
    player.update();
    for (GameObject enemy : enemies) {
      enemy.update();
    }
    for (GameObject obstacle : obstacles) {
      obstacle.update();
    }
  }

  void draw() {
    player.draw();
    for (GameObject enemy : enemies) {
      enemy.draw();
    }
    for (GameObject obstacle : obstacles) {
      obstacle.draw();
    }
  }

  public boolean checkCollision(GameObject object) {
    if (checkCollisionWith(object, enemies) || checkCollisionWith(object, obstacles)) {
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

  public boolean checkCollisionBetween(GameObject a, GameObject b) {
    if (a.x + a.width >= b.x && a.x <= b.x + b.width && a.y + a.height >= b.y && a.y < b.y + b.height) {
      a.collidedWith(b);
      b.collidedWith(a);
      return true;
    }

    return false;
  }
}
