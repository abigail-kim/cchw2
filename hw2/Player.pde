public class Player {
  
  float x, y;
  float w, h;
  
  float yVelocity = 0; 
  float gravity = 4.0; 
  float jumpForce = -50; 
  boolean onGround = true;        
  
  Player() {
   w = 50;
   h = 50;
   x = 105;
   y = height - h - 60;
  }

 void display() {
   fill(#8C3F5B);
   rect(x, y, w, h); 
 }
 
 void update() {
   y += yVelocity;         
    yVelocity += gravity;   

    //players stops at ground
    if (y >= height - h - 60) {
      y = height - h - 60;
      yVelocity = 0;
      onGround = true;
   }
}
 
 void jump() {
   if (onGround) {      
      yVelocity = jumpForce; 
      onGround = false;
    }
  }
}
