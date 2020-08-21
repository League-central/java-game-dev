public class World {
  Player player;
  Checkpoint checkpoint;
  double gravity = 0.2;
  ArrayList<GameObject> enemies = new ArrayList<GameObject>(); 
  ArrayList<GameObject> obstacles = new ArrayList<GameObject>();
  ArrayList<GameObject> projectiles = new ArrayList<GameObject>();
  int level=1;


  World() {
    player = new Player(50, 200, 20, 20);
    checkpoint= new Checkpoint(500,50,40,80);
    obstacles.add(new Obstacle(20, 400, 400, 30));
    enemies.add(new Enemy(250, 100, 40, 40));
    obstacles.add(new Obstacle(500, 250, 100, 30));
   
    
  }
void createlevel2(){
  player = new Player(50, 10, 20, 20);
  checkpoint= new Checkpoint(650,280,40,80);
    obstacles.add(new Obstacle(20, 400, 400, 30));
    enemies.add(new Enemy(500, 50, 40, 40));
    obstacles.add(new Obstacle(420, 300, 50, 30));
}
void createnextlevel(){
   enemies.clear();
  obstacles.clear();
  projectiles.clear();
  level+=1;
  if(level==2){
    createlevel2();
  }
  if(level==3){
    createlevel3();
    
  }
  if(level==4){
    createlevel4();
  }
  if(level==5){
    createlevel5();
  }
}
    void createlevel3(){
      player = new Player(50, 20, 20, 20);
      checkpoint= new Checkpoint(650,280,40,80);
      
        obstacles.add(new Obstacle(20, 200, 400, 30));
        enemies.add(new Enemy(500, 50, 40, 40));
    }
    
 void createlevel4(){
    player = new Player(100, 30, 20, 20);
    checkpoint= new Checkpoint(700,100,40,80);
     obstacles.add(new Obstacle(20, 200, 1000, 30));
     enemies.add(new Enemy(500, 50, 40, 40));
     enemies.add(new Enemy(300, 50, 40, 40));
     enemies.add(new Enemy(420, 50, 40, 40));
     enemies.add(new Enemy(200, 50, 40, 40));
     enemies.add(new Enemy(600, 50, 40, 40));
      obstacles.add(new Button(160, 100, 20, 20));
     
 }
 void createlevel5(){
   player = new Player(100, 30, 20, 20);
   obstacles.add(new Obstacle(20, 200, 1000, 30));
    obstacles.add(new Ending(500, 50, 100, 100));
    checkpoint= new Checkpoint(2000,2000,10,10);
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
