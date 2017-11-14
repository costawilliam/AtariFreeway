class Cars{
  int x, y, style, speed;  
  
  Cars(int x_, int y_, int _style){
    x = x_;
    y = y_;
    style = _style;          
  }
  
  void update() {
    speed = (int) random(0,5) * level;
    if (style % 2 ==1){
      speed = speed * (-1);
    }  
    
    if (speed > 0){
      x = x + (speed);
      if (x > 898){
        x = 50;       
      }     
    } 
    else{
      x = x - (speed);
      if (x < 50){
        x = 940;
      }       
    }           
  }
  
  void display(int s){
    switch(s){
    case 0:    
      image(car0, x, y, Char.width, Char.height); 
      break;
    case 1:    
      image(car1, x, y, Char.width, Char.height); 
      speed = speed * (-1);      
      break;     
    case 2:    
      image(car2, x, y, Char.width, Char.height); 
      break;  
    case 3:    
      image(car3, x, y, Char.width, Char.height); 
      speed = speed * (-1);
      break;        
    }
  }
  

}