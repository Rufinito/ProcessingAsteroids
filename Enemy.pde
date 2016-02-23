//Enemy Class
class Enemy
{
  //variable to check if enemy is alive
  Boolean alive;
  //random x position
  float randomX;
  //enemy position
  PVector pos;
  
  Enemy()
  {
    //when Enemy is spawned, it is alive
    alive = true;
    //randomize x coordinate
    randomX = random(0, 450); // width of screen
    //set enemy position
    pos = new PVector(randomX, -10);
    
  }
  
  void update()
  {
    //Move enemy down at a constant rate
    pos.y++;
    
  }
  void render()
  {
    //drawing configurations
    fill(100);
    smooth();
    noStroke();
    ellipse(pos.x, pos.y, 10 ,10 );
  }
  
}
    
