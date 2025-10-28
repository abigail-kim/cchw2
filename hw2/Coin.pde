public class Coin {
  
  float x, y, size;
  float speed;
  boolean collected = false;
  PImage img;

  Coin(float posX, float posY, float s, float velX, PImage coinImg) {
    x = posX;
    y = posY;
    size = s;
    speed = velX;
    img = coinImg;
  }

  void move() {
    x -= speed;
    if (x + size < 0) {
      x = width + random(100, 500); //reset coin
      y = height - 60 - random(50, 200);
      collected = false;
    }
  }

  void show() {
    if (!collected) {
      image(img, x - size/2, y - size/2, size, size);
    }
  }
}
