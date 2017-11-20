PImage Backgroud, Char, Char2;
PImage car0, car1, car2, car3;

int x = 550;
int y = 630;
int level = 1;
int retry = 0;
int level_previous;
int collisions = 0;
Cars[] cars = new Cars[11];

void setup(){
  size(1100, 720);
  Backgroud = loadImage("image/Backgroud.png");
  Char= loadImage("image/Char.png");
  Char2= loadImage("image/Char.png");
  car0= loadImage("image/car0.png"); 
  car1= loadImage("image/car1.png"); 
  car2= loadImage("image/car2.png"); 
  car3= loadImage("image/car3.png");

  for (int i = 0; i < cars.length; i++ ) {
    int style = (int) random(0,4);
    int pos_x = (int) random(0,1000);
    cars[i] = new Cars(pos_x, 579 - (51*i),style);
  }

  image(Backgroud, 0, 0);
  image(Char, x, y, Char.width, Char.height); 

  for (int i = 0; i < cars.length; i++ ) {
    cars[i].display(cars[i].style); 
    cars[i].update(0);
  }
}

void draw() {
  collision();
  image(Backgroud, 0, 0);
  image(Char, x, y, Char.width, Char.height); 

  for (int i = 0; i < cars.length; i++ ) {
    cars[i].display(cars[i].style);
    cars[i].update(0);
  }

  textSize(48);
  fill(#9D0606);
  text(level, 75, 42);
  text(collisions, 900, 42);
  text("collisions:", 600, 42);
  image(Char2, 840, 0, Char2.width, Char2.height); 
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      println("UP"); 
      y = y - 51;
      if (y == 18){
        y = 46;
      }
      if (y < 18){
        y = 630;
        level_previous = level;
        level = level + 1;
        for (int j = 0; j < cars.length; j++ ) { 
          cars[j].update(1);
        }
      } 
    } 
    else if (keyCode == RIGHT) {
      println("RIGHT"); 
      x = x + 51 ;
      if (x > 898){
        x = 949; 
      }
    }
    else if (keyCode == LEFT) {
      println("LEFT");
      x = x - 51;
      if (x < 50){
        x = 50;
      } 
    } 
    else if (keyCode == DOWN) {
      println("DOWN");    
      y = y + 51;
      if (y > 630){
        y = 630;
      }  
    }
  }  
  else { 
    switch (key) { 
      case 'w':
      case 'W':
        y = y - 51;
        if (y == 18){
          y = 46;
        }
        if (y < 18){
          y = 630;
          level_previous = level;
          level = level + 1;
          for (int j = 0; j < cars.length; j++ ) { 
            cars[j].update(1);
          }
        } 
      break;
      case 's':
      case 'S':
        y = y + 51;
        if (y > 630){
          y = 630;
        } 
      break; 
      case 'd':
      case 'D':
        x = x + 51 ;
        if (x > 898){
          x = 949; 
        } 
      break;
      case 'a':
      case 'A':
        x = x - 51;
        if (x < 50){
          x = 50;
        }
      break;
    }
  } 
}

void collision(){
  for (int i = 0; i < cars.length; i++ ) {
    if (x < cars[i].x + car0.height && x + Char.height >cars[i].x && 
    y <cars[i].y + car0.height && Char.height + y > cars[i].y) {
      switch (level){
        case 1:
          y = y + 51;
          break;
        case 2: 
           y = y + 102;
           break;
        case 3:
          y = 630;
        case 4: 
          y = 630;
          for (int j = 0; j < cars.length; j++ ) {            
            if (j % 2 == 0){            
              cars[j].update(1);             
            }
          }
          break;
        case 5: 
          y = 630;
          for (int j = 0; j < cars.length; j++ ) { 
            cars[j].update(1);
          }
          break;
        default:
          retry++;         
          println(retry);
          if(level_previous > level){
              retry = 0;

          }
          y = 630;
         
          if(retry > 3){
            retry = 0;
            for (int j = 0; j < cars.length; j++ ) { 
              if (cars[j].speed > 0){
                 cars[j].update(-4);                  
                 if (cars[j].speed < 0 || cars[j].speed == 0){
                   cars[j].speed = 1;
                 }  
              }else {
                  cars[j].update(-4); 
                  if (cars[j].speed > 0 || cars[j].speed ==0){
                   cars[j].speed = -1;
                  } 
              }  
                 
              
            }
            
           
            break;
          }
          else{
              for (int j = 0; j < cars.length; j++ ) { 
                cars[j].update(1); 
              }
            break;
          }
      }    
      collisions++;
      
      
      if (y > 630){
        y = 630;
      }

    } 
  }
} 