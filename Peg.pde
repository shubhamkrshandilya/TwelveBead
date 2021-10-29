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
   //fill(255);
   fill(231);
   if(!this.piece){
     fill(11);
   }
   if(this.selected){
     push();
     strokeWeight(8);
     ellipse(this.x, this.y, this.size, this.size);
     pop();
   }else{
     ellipse(this.x, this.y, this.size, this.size);
   }
 }
 
 Peg clicked(int px, int py) {
   float distr = dist(px, py, this.x, this.y);
   if(distr < this.size/2){
     //println("clicked");
     return this;
   }
   return null;
 }
 
 void makeSelect(){
   this.selected = true;
 }
 
 void disableSelect(){
   this.selected = false;
 }
 
 void move(float px, float py){
   this.x = px;
   this.y = py;
 }
 
 boolean validMove(ArrayList<Peg> pegs){
   
   return false;
 }
 
 public void to_string(){
   println("X: " + this.x + " Y: " + this.y);
   println("Color: " + (this.piece == true ? "White": "Black"));
   println("Size: " + this.size + " Selected: " + this.selected);
 }

}
