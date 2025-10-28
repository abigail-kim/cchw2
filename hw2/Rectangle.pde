public class Rectangle {
  
  float x, y;
  float w, h;
  float speed; 
  
  //ground (rectangle)
  Rectangle(int posX, float posY, int rectW, int rectH, int velX){ 
    x = posX;
    y = posY;
    w = rectW;
    h = rectH;
    speed = velX;
}

  void display() {
    fill(#707326);
    rect(x, y, w, h);
}

  void move(Rectangle other) {
    x -= speed;
    //reset
    if (x + w < 0){
       x = other.x + other.w - speed;
    }
  }
}
