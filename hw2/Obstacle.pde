public class Obstacle {
  
  float x, y;
  float w, h;
  float speed; 
  int col;
  
  Obstacle(int posX, float posY, int rectW, int rectH, int velX){
    x = posX;
    y = posY;
    w = rectW;
    h = rectH;
    speed = velX;
    col = color(random(255), random(255), random(255));
}

  void move() {
    x -= speed;
    if (x + w < 0) {
      x = width;
      y = height - 60 - random(0, 250);
      col = color(random(255), random(255), random(255));
  }
}

void show() {
  fill(col);
  rect(x, y, w, h);
  }
} 
