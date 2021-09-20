class Peg{
 float x;
 float y;
 boolean piece;
 int size;
 public Peg(float x, float y, boolean piece){
   this.x = x;
   this.y = y;
   this.piece = piece;
   this.size = 40;
 }
 
 void show(){
   noStroke();
   fill(255);
   if(!this.piece){
     fill(11);
   }
   ellipse(this.x, this.y, this.size, this.size);
 }
 
 void clicked() {
   float distr = dist(mouseX, mouseY, this.x, this.y);
   if(distr < this.size/2){
     
   }
 }
}
