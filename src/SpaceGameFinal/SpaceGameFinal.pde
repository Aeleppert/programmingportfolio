//Space Game 2020 December by Alice Leppert

Spaceship s;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
ArrayList<Powerup> pUps;
ArrayList<Enemy> enemies;
ArrayList<Enemylaser> elasers;
Timer rocktimer, puTimer, enemyTimer;
int level, score, pass, game, weaponCount, superWeapon, rockRate, laserCount, enemyHealth, counter;
boolean play, mouseReleased, firstgame;
Button buttons;
import processing.sound.*;
SoundFile slaser;
import processing.sound.*;
SoundFile kaboom;
import processing.sound.*;
SoundFile ding;


void setup() {
  size(500, 500);
  s = new Spaceship(#40E1F5);
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  pUps = new ArrayList();
  elasers = new ArrayList();
  enemies = new ArrayList();
  enemyTimer = new Timer(9500);
  enemyTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  rocktimer = new Timer(int(random(1000, 5000)));
  rocktimer.start();
  score = 0;
  weaponCount = 1;
  superWeapon = 0;
  play = false;
  buttons = new Button(width/2, height/2+40, 150, 20, "Click to Play Again...");
  level = 1;
  pass = 0;
  score = 0;
  counter = 0;
  enemyHealth = 75;
  slaser = new SoundFile(this, "laser.wav");
  kaboom = new SoundFile(this, "Explosion blast.wav");
  ding = new SoundFile(this, "New_Mail.wav");
}

void draw() {
  //Game Play
  if (!play ) {
      noCursor();
    startScreen();
  } else {
     noCursor();
    gamePlay();
  }
  if (s.health<1 && s.lives<1 || pass>10) {
    play = false;
    gameOver();
    buttons.display();
    buttons.hover();
    if (mousePressed) {
      if (buttons.hover) {
        play = true;
        s.lives = 3;
        weaponCount = 1;
        s.health = 100;
        pass = 0;
        score = 0;
        asteroids.removeAll(asteroids);
        rocktimer.start();
        enemies.removeAll(enemies);
        enemyTimer.start();
        pUps.removeAll(pUps);
        puTimer.start();
        gamePlay();
      }
    }
  }
}

void mouseReleased() {
  slaser.play();

  if (weaponCount == 1) {
    lasers.add(new Laser(color(255, 0, 0), s.x, s.y ));
  } else if (weaponCount <= 3) {
    lasers.add(new Laser(color(255, 0, 0), s.x, s.y ));
    lasers.add(new Laser(color(255, 0, 0), s.x +41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -41, s.y+5 ));
  } else if (weaponCount <= 5) {
    lasers.add(new Laser(color(255, 0, 0), s.x, s.y ));
    lasers.add(new Laser(color(255, 0, 0), s.x +41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x +19, s.y+37 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -19, s.y+37 ));
  } else if (weaponCount >= 6) {
    lasers.add(new Laser(color(255, 0, 0), s.x, s.y ));
    lasers.add(new Laser(color(255, 0, 0), s.x +41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x +19, s.y+37 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -19, s.y+37 ));
    lasers.add(new Laser(color(255, 0, 0), s.x, s.y ));
    lasers.add(new Laser(color(255, 0, 0), s.x +41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -41, s.y+5 ));
    lasers.add(new Laser(color(255, 0, 0), s.x +19, s.y+37 ));
    lasers.add(new Laser(color(255, 0, 0), s.x -19, s.y+37 ));
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome to Space Game!", width/2, height/2);
  text("Click to Continue...", width/2, height/2+20);

  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(129, 129);
  rectMode(CORNER);
  textAlign(LEFT);
  rect(0, height-60, width, 60);
  fill(#FF352E, 128);
  text("Health: " + s.health, 40, height-20);
  fill(#16F01E, 128);
  if (s.health <1 && s.lives>0) {
    s.health+= 100;
    s.lives--;
  }
  text("Lives: " + s.lives, 160, height-20);
  if (pass>5) {
    fill(#FF352E, 128);
    text("Passed: " + pass, 260, height-20);
  } else {
    fill(255, 128);
    text("Passed: " + pass, 260, height-20);
  } 
  fill(255, 128);
  text("Score: " + score, 380, height-20);
}

//Draw for gameplay
void gamePlay() {
  background(0);

  //stars backgorund
  stars.add(new Star(int(random(width)), int(random(height)), color(random(190, 255))));
  for (int i = 0; i< stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachBottom()) {
      stars.remove(star);
    }
  }

  //rock timer
  if (rocktimer.isFinished()) {
    asteroids.add(new Asteroid(int(random(width)), -50));
    rocktimer.start();
  }

  for (int i = 0; i< asteroids.size(); i++) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.display();
    asteroid.move();
    // Asteroid-ship collision
    if (s.asterIntersection(asteroid)) {
      s.health-=asteroid.health;
      asteroids.remove(asteroid);
      kaboom.play();
      score+= asteroid.health;
    }
    if (asteroid.reachBottom()) {
      pass++;
      asteroids.remove(asteroid);
    }
  }

  //Power UP timer
  if (puTimer.isFinished()) {
    pUps.add(new Powerup(int(random(width)), -50));
    puTimer.start();
  }

  for (int i = 0; i< pUps.size(); i++) {
    Powerup pu = pUps.get(i);
    pu.display();
    pu.move();
    //Intersection
    if (s.puIntersect(pu)) {
      if (pu.powup == 0) {//Ammo
        weaponCount++;
      } else if (pu.powup == 1) {//health
        s.health+= 50;
      } else if (pu.powup == 2) { //Lives
        s.lives += 1;
      }
      pUps.remove(pu);
    }
    if (pu.reachBottom() ) {
      pUps.remove(pu);
    }
  }

  //Call enemy
  if (enemyTimer.isFinished()) {
    if(weaponCount <= 4) {
    enemies.add(new Enemy(-20, 100));
    } else if (weaponCount >=5) {
          enemies.add(new Enemy(-20, 150));
    enemies.add(new Enemy(-20, 100));
    }
    enemyTimer.start();
  }
  for (int i = 0; i< enemies.size(); i++) {
    Enemy enemy = enemies.get(i);
    enemy.display();
    enemy.move();
    // Asteroid-enemy collision
    for (int j = 0; j<asteroids.size(); j++) {
      Asteroid asteroid = asteroids.get(j);
      if (asteroid.easterIntersection(enemy)) {
        asteroid.health -=20;
        enemy.health -=20;
        if (asteroid.health<1) {
          asteroids.remove(asteroid);
          kaboom.play();
          score+=20;
        }
        if (enemy.health<1) {
          enemies.remove(enemy);
          kaboom.play();
          score+=75;
        }
      }
      if (enemy.reachRight()) {
        enemies.remove(enemy);
      }
    }
    if (enemyTimer.savedTime > 3000) counter++;
    if (counter > 250) {
      counter=0;
      elasers.add(new Enemylaser(color(0, 255, 0), enemy.x +41, enemy.y+5 ));
       slaser.play();
    }
  }

  //Call lasers
  for (int i = 0; i< lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.fire();
    //laser-asteroid collision
    for (int j = 0; j<asteroids.size(); j++) {
      Asteroid asteroid = asteroids.get(j);
      if (asteroid.laserIntersection(laser)) {
        asteroid.health -=10;
        lasers.remove(laser);
        if (asteroid.health<1) {
          asteroids.remove(asteroid);
          kaboom.play();
          score+=20;
        }
      }
    }

    //laser-enemy collision
    for (int k = 0; k<enemies.size(); k++) {
      Enemy enemy = enemies.get(k);
      if (enemy.etlaserIntersection(laser)) {
        enemy.health -=10;
        lasers.remove(laser);
        if (enemy.health<1) {
          enemies.remove(enemy);
          kaboom.play();
          score+=75;
        }
      }
    }

    if (laser.reachTop()) {
      lasers.remove(laser);
    }
  }

  //Call enemy lasers
  for (int i = 0; i< elasers.size(); i++) {
    Enemylaser elaser = elasers.get(i);
    elaser.display();
    elaser.fire();
    //laser-asteroid collision
    for (int j = 0; j<asteroids.size(); j++) {
      Asteroid asteroid = asteroids.get(j);
      if (asteroid.elaserIntersection(elaser)) {
        lasers.remove(elaser);
          asteroids.remove(asteroid);
          kaboom.play();
      }
    }
    // elaser-ship collision
    if (s.eltsIntersection(elaser)) {
      s.health-=elaser.health;
      elasers.remove(elaser);
    }
    if (elaser.reachBottom()) {
      elasers.remove(elaser);
    }
  }
  s.display(mouseX, mouseY);
  infoPanel();
}

void gameOver() {
  cursor();
  background(0);
  textSize(12);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
}
