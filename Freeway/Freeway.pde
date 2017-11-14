PImage Backgroud;  
PImage Char;
int x = 100;
int y = 630;
int level = 1;

void setup() {
  size(1100, 720);
  Backgroud = loadImage("image/Backgroud.png");  
  Char =loadImage("image/Char.png");  
  image(Backgroud, 0, 0);
  image(Char, x, y, Char.width, Char.height);
}

void draw() {
  image(Backgroud, 0, 0);
  image(Char, x, y, Char.width, Char.height);
  textSize(48);
  fill(#9D0606);
  text(level, 75, 42);
}


void keyPressed(){  
  switch (key) {   
    case 'w':    
    case 'W':     
      println("key w");  
      y = y - 51;    
      if (y == 18){
         y = 46;
      }
      if (y < 18){
        y = 630;
        level = level + 1;
      }     
      redraw();
      break;  
      
    case 's':      
    case 'S':          
      println("key s");    
      y = y + 51;
      if (y > 630){
        y = 630;
      }   
      redraw();
      break;   
      
    case 'd':      
    case 'D':          
      println("key d");     
      x = x + 51 ;
      if (x > 898){
        x = 949;       
      }     
      redraw();      
      break;  
      
    case 'a':      
    case 'A':      
      println("key a");  
      x = x - 51;
      if (x < 50){
        x = 50;
      }
      redraw();
      break;    
  } 
}    