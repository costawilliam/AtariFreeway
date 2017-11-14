PImage Backgroud, Char;  
PImage car0, car1, car2, car3;

int x = 550;
int y = 630;
int level = 1;
Cars[] cars = new Cars[11];

void setup() {
  size(1100, 720);
  Backgroud = loadImage("image/Backgroud.png");  
  Char      = loadImage("image/Char.png");  
  car0      = loadImage("image/car0.png"); 
  car1      = loadImage("image/car1.png");   
  car2      = loadImage("image/car2.png");   
  car3      = loadImage("image/car3.png");  
  
  for (int i = 0; i < cars.length; i++ ) {
    int style = (int) random(0,4);
    int pos_x = (int) random(0,1000);
    cars[i] = new Cars(pos_x, 579 - (51*i),style);
  }  

  image(Backgroud, 0, 0);
  image(Char, x, y, Char.width, Char.height); 
  
  for (int i = 0; i < cars.length; i++ ) {  
    cars[i].display(cars[i].style);   
    cars[i].update();
  }  

}

void draw() {
  collision();
  image(Backgroud, 0, 0);
  image(Char, x, y, Char.width, Char.height);   
  
  for (int i = 0; i < cars.length; i++ ) {  
    cars[i].display(cars[i].style);
    cars[i].update();    
  }
  
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
      //redraw();
      break;  
      
    case 's':      
    case 'S':          
      println("key s");    
      y = y + 51;
      if (y > 630){
        y = 630;
      }   
      //redraw();
      break;   
      
    case 'd':      
    case 'D':          
      println("key d");     
      x = x + 51 ;
      if (x > 898){
        x = 949;       
      }     
      //redraw();      
      break;  
      
    case 'a':      
    case 'A':      
      println("key a");  
      x = x - 51;
      if (x < 50){
        x = 50;
      }
      //redraw();
      break;    
  } 
}    

void collision(){
  for (int i = 0; i < cars.length; i++ ) {  
    if (x < cars[i].x + car0.height  && 
        x + Char.height >  cars[i].x && 
        y <  cars[i].y + car0.height && 
        Char.height + y > cars[i].y) {
          y = y + 51;
          if (y > 630){
            y = 630;
          }
    } 
  }
} 