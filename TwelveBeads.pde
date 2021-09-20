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
  strokeWeight(6);
  board.show();
}



void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
