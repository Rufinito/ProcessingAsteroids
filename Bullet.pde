//Bullet Class
class Bullet
{
  PVector pos;
  
  Bullet(PVector playerPos)
  {
    //set bullet position to the player position.
    pos = new PVector(playerPos.x, playerPos.y);
  }
  
  void update()
  {
    //move the bullet UP
    pos.y-=5;
  }
  void render()
  {
    fill (160);
    smooth();
    noStroke();
    ellipse(pos.x, pos.y,5 ,5 );
  }
}