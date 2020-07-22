public class World {
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();

  World() {
  }

  boolean checkCollision(GameObject object) {
    if (checkCollisionWith(object, enemies) || checkCollisionWith(object, obstacles)) {
      return true;
    }
    return false;
  }

  boolean checkCollisionWith(GameObject object, ArrayList<GameObject> list) {
    for (GameObject listObj : list) {
      if (checkCollisionBetween(object, listObj)) {
        return true;
      }
    }
    return false;
  }

  boolean checkCollisionBetween(GameObject a, GameObject b) {
    if (a.x + a.width >= b.x && a.x <= b.x + b.width && a.y + a.height >= b.y && a.y < b.y + b.height) {
      return true;
    }

    return false;
  }
}
