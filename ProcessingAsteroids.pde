Boolean keyUp = false;
Boolean keyDown = false;
Boolean keyRight = false;
Boolean keyLeft = false;

Boolean shootKey = false;

int lastTimeCheck;
int timeIntervalFlag = 2000;

//bullet timer
int bulletTimeCheck;
int bulletTimeIntervalFlag = 200;

PVector pos = new PVector(225,550);

//Enemy List
public ArrayList<Enemy> enemies; //caps matter!

//Bullet List
public ArrayList<Bullet> bullets;

void setup()
{
    size(450,600);
    frameRate(60);
    
    //initialize enemy list
    enemies = new ArrayList();
    //initialize bullet list
    bullets = new ArrayList();
    
    
    //set time
    lastTimeCheck = millis();
    bulletTimeCheck = millis();
    
}

void update()

{
  //bullets
  if(shootKey) 
  {
    if(millis() > bulletTimeCheck + bulletTimeIntervalFlag)
    {
      bullets.add(new Bullet(pos));
      bulletTimeCheck = millis();
    }
  };
  
  
  if (keyUp) pos.y-=2;
  if (keyDown) pos.y+=2;
  if (keyRight) pos.x+=2;
  if (keyLeft) pos.x-=2;
  
  //add enemies according to a timer
  if(millis() > lastTimeCheck + timeIntervalFlag)
  {
    enemies.add(new Enemy());
    lastTimeCheck = millis();
  }
  
  //Draw and Update Enemies
  for (int i = 0; i < enemies.size() - 1; i++ )
  {
    Enemy enem = ( Enemy ) enemies.get(i);
    enem.update();
    enem.render();
    //check collisions
    if(checkCollide(enem.pos, pos, 10))
    this.exit();
  }
  
  for (int i = 0; i < bullets.size() ; i++ )
  {
    Bullet bull = ( Bullet ) bullets.get(i);
    bull.update();
    bull.render();
    
    //check collisions between bullets and enemies
    //THIS MEANS
    //For every bullet, check collisions with every enemy.
    for (int j = 0; j < enemies.size(); j++ )
    {
      Enemy enem = ( Enemy ) enemies.get(j);
      
      if(checkCollide(enem.pos, bull.pos, 10))
      {
        //If they collide, remove both
        bullets.remove(i);
        enemies.remove(j);
        //This is where you would increase your score
      }
    }
  }
  
}

void draw()
{

    background(255);

  update();
    fill(0);
    smooth();
    noStroke();
    ellipse(pos.x, pos.y, 20, 20);
}

void keyPressed()

{
    
  if ( keyCode == UP ) keyUp = true;
  if ( keyCode == DOWN ) keyDown = true;
  if ( keyCode == RIGHT ) keyRight = true;
  if ( keyCode == LEFT ) keyLeft = true;
  
  if ( keyCode == CONTROL) shootKey = true;
  
}

void keyReleased()

{
    
  if ( keyCode == UP ) keyUp = false;
  if ( keyCode == DOWN ) keyDown = false;
  if ( keyCode == RIGHT ) keyRight = false;
  if ( keyCode == LEFT ) keyLeft = false;
  
  if ( keyCode == CONTROL) shootKey = false;
  
}

boolean checkCollide( PVector el, PVector e2, float rl )
{
  if ( dist( el.x, el.y, e2.x, e2.y ) <= rl) return true;
  else return false;
}

void mousePressed()
{
}