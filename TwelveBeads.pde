Board board;
boolean locked;
int offset;
Peg prev;
void setup(){
  size(800, 600);
   //fullScreen();
   offset = 40;
  board = new Board(500);
  locked = false;
  prev = null;
}

void draw(){
  background(81);
  stroke(201);
  strokeWeight(4);
  board.show();
  //noLoop();
}

void mousePressed(){
  board.onMousePressed();
}

//void mousePressed() {
//  Peg p = null;
//  for(Peg peg : board.whitePegs){
//    if(peg.clicked(mouseX, mouseY) != null){
//       p = peg.clicked(mouseX, mouseY);
//    }
//  }
  
//  for(Peg peg : board.blackPegs){
//    if(peg.clicked(mouseX, mouseY) != null){
//       p = peg.clicked(mouseX, mouseY);
//    }
//  }
//  if(p != null){
//    p.show();
//    if(prev == null){
//      if(!p.selected){
//        p.makeSelect();
//        prev = p;
//      }
//    }
//    else if(prev == p){
//      p.disableSelect();
//      prev = null;
//    }
//  }else{
//    if(prev != null){
//      if(prev.selected){
//        PVector nearPoint = board.findNear(mouseX, mouseY);
//        //print(nearPoint);
//        if(nearPoint != null){
//          prev.move(nearPoint.x, nearPoint.y);
//        }
//        prev.disableSelect();
//        prev = null;
//      }
//    }
//  }

//}

//void mouseDragged() {
//  if(locked) {
//    bx = mouseX-xOffset; 
//    by = mouseY-yOffset; 
//  }
//}

//void mouseReleased() {
//  locked = false;
//}
