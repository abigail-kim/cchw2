Player player;
Rectangle rectangle1, rectangle2;
Obstacle obs1, obs2;
Coin coin;

import processing.sound.*;
SoundFile file; //coin sound
SoundFile bgMusic; //nature background music

PImage bg;
PImage coinImage;

float bgX = 0;
int score = 0; //tracks coins collected
String gameState = "start";

void setup() {
  frameRate(60);
  size(700, 500);
  
  bg = loadImage("background.jpg");
  coinImage = loadImage("coin.png");
  
  
  player = new Player();
  
  rectangle1 = new Rectangle(0, height - 60, width, 60, 9); 
  rectangle2 = new Rectangle(width, height - 60, width, 60, 9);
  
  obs1 = new Obstacle(width, height - 60 - random(30, 250), 40, 50, 9);
  obs2 = new Obstacle(width + 400, height - 60 - random(0, 250), 40, 50, 9);

  coin = new Coin(width + 200, height - 60 - random(50, 200), 40, 8, coinImage);
  
  file = new SoundFile(this, "coin.wav");
  bgMusic = new SoundFile(this, "nature.wav");
  bgMusic.loop();
  
  file.play();
  
}

void draw() {
  image(bg, bgX, 0, width, height);
  image(bg, bgX + width, 0, width, height);
  bgX -= 6;
  
  if (bgX <= -width) {
  bgX = 0; //loops background
 }

  if (gameState.equals("start")) {
    fill(#FF6A61);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Press SPACE to start", width/2, height/2);
        
    textSize(15);
    text("Collect coins and avoid the obstacles!", width/2, height/2 + 40);
    text("Use SPACE to jump", width/2, height/2 + 70);
  } 
  
   else if (gameState.equals("play")) {

    player.update();
    player.display(); 

    rectangle1.move(rectangle2);
    rectangle1.display();

    rectangle2.move(rectangle1);
    rectangle2.display(); 

    obs1.move();
    obs1.show();
    
    obs2.move();
    obs2.show();
    
    coin.move(); 
    coin.show();

   if (isColliding(player, obs1) || isColliding(player, obs2)) {
      gameState = "gameOver";
    }

   if (!coin.collected && player.x < coin.x + coin.size &&
          player.x + player.w > coin.x &&
          player.y < coin.y + coin.size &&
          player.y + player.h > coin.y) {
        
        coin.collected = true;
        score ++;
        
        file.play();
     }
    
    //score
    fill(0);
    textSize(20);
    textAlign(RIGHT, TOP);
    text("Coins: " + score, width - 20, 20);
    }
  
   else if (gameState.equals("gameOver")) { 
    fill(255, 0, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Game over", width/2, height/2);
    
    textSize(16);
    text("Press r to restart", width/2, height/2 + 50);
  }
}    
    
   //help to detect collision
  boolean isColliding(Player p, Obstacle o) {
    return (p.x < o.x + o.w &&
            p.x + p.w > o.x &&
            p.y < o.y + o.h &&
            p.y + p.h > o.y);
}

void keyPressed() {
  if (gameState.equals("start") && key == ' ') {
    gameState = "play";
  } 
    else if (gameState.equals("play") && key == ' ') {
    player.jump();
  } 
  else if (gameState.equals("gameOver") && (key == 'r' || key == 'R')) {
    restartGame();
  }
}

  void restartGame() {
    score = 0;
    player = new Player();
    rectangle1 = new Rectangle(0, height - 60, width, 60, 9); 
    rectangle2 = new Rectangle(width, height - 60, width, 60, 9);
    obs1 = new Obstacle(width, height - 60 - random(30, 250), 40, 50, 9);
    obs2 = new Obstacle(width + 400, height - 60 - random(0, 250), 40, 50, 9);
    coin = new Coin(width + 200, height - 60 - random(50, 200), 40, 8, coinImage);
    gameState = "play";
}
