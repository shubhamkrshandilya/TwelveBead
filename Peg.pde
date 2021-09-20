class Peg{
 float x;
 float y;
 boolean piece;
 int size;
 boolean selected;
 public Peg(float x, float y, boolean piece){
   this.x = x;
   this.y = y;
   this.piece = piece;
   this.size = 40;
   this.selected = false;
 }
 
 void show(){
   //noStroke();
   fill(255);
   if(!this.piece){
     fill(11);
   }
   if(this.selected){
     strokeWeight(8);
   }
   ellipse(this.x, this.y, this.size, this.size);
 }
 
 Peg clicked(int px, int py) {
   float distr = dist(px, py, this.x, this.y);
   if(distr < this.size/2){
     print("clicked");
     return this;
   }
   return null;
 }
 
 
}
