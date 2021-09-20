Board board;
boolean locked;

void setup(){
  size(800, 600);
  board = new Board(500);
  locked = false;
}

void draw(){
  background(81);
  stroke(201);
  strokeWeight(4);
  board.show();
  //noLoop();
}



void mousePressed() {
  Peg p = null;
  for(Peg peg : board.whitePegs){
    p = peg.clicked(mouseX, mouseY);
  }
  
  for(Peg peg : board.blackPegs){
    p = peg.clicked(mouseX, mouseY);
  }
  if(p != null){
    p.show();
  }

}

//void mouseDragged() {
//  if(locked) {
//    bx = mouseX-xOffset; 
//    by = mouseY-yOffset; 
//  }
//}

//void mouseReleased() {
//  locked = false;
//}
