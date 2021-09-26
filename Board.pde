class Board {
  int size;
  PVector[] blocks;
  ArrayList<Peg> whitePegs;
  ArrayList<Peg> blackPegs;
  Peg prev;
  boolean currMove; //true for white false for black
  public Board(int size) {
    this.size = size;
    this.blocks = new PVector[25];
    this.whitePegs = new ArrayList<Peg>();
    this.blackPegs = new ArrayList<Peg>();
    this.prev = null;
    currMove = true;
    this.setBlocks();
    //this.printBlocks();
    this.setPegs();
  }

  void setBlocks() {
    int k = 0;
    for (int j=0; j<5; j++) {
      for (int i=0; i<5; i++) {
        blocks[k] = new PVector((width - this.size)/2 + i*this.size/4, (height - this.size)/2 + j*this.size/4);
        k++;
      }
    }
  }

  void printBlocks() {
    for (int i=0; i<this.blocks.length; i++) {
      println(blocks[i].x, " ", blocks[i].y);
    }
  }

  void setPegs() {
    for (int i=0; i<12; i++) {
      whitePegs.add(new Peg(blocks[i].x, blocks[i].y, true));
      blackPegs.add(new Peg(blocks[blocks.length - i - 1].x, blocks[blocks.length - i - 1].y, false));
    }
  }
  void showPegs(){
    for(Peg peg: this.whitePegs){
      peg.show();
    }
    
    for(Peg peg: this.blackPegs){
      peg.show();
    }
  }
  
  PVector findNear(float px, float py){
    PVector nearPoint = null;
    for(PVector loc: this.blocks){
      float dist = dist(loc.x, loc.y, px, py);
      if(dist < 40){
        nearPoint = loc;
      }
    }
    //print(nearPoint);
    return nearPoint;
  }
  void show() {
    drawVertical();
    drawHorizontal();
    drawDiagonal();
    smallSquare();
    showPegs();
  }

  void drawVertical() {
    for (int i = 0; i < 5; i++) {
      //print(i);
      line((width - this.size)/2 + i*this.size/4, (height - this.size)/2, (width - this.size)/2 + i*this.size/4, (height + this.size)/2);
    }
  }

  void drawHorizontal() {
    for (int i = 0; i < 5; i++) {
      //print(i);
      line((width - this.size)/2, (height - this.size)/2 + i*this.size/4, (width + this.size)/2, (height - this.size)/2 + i*this.size/4);
    }
  }

  void drawDiagonal() {
    line((width - this.size)/2, (height - this.size)/2, (width + this.size)/2, (height + this.size)/2);
    line((width + this.size)/2, (height - this.size)/2, (width - this.size)/2, (height + this.size)/2);
  }

  void smallSquare() {
    line((width - this.size)/2, (height)/2, (width)/2, (height + this.size)/2);
    line((width + this.size)/2, (height)/2, (width)/2, (height - this.size)/2);
    line((width)/2, (height + this.size)/2, (width + this.size)/2, (height)/2);
    line((width)/2, (height - this.size)/2, (width - this.size)/2, (height)/2);
  }
  
  void onMousePressed() {
    Peg p = null;
    if(currMove){
      for(Peg peg : this.whitePegs){
        if(peg.clicked(mouseX, mouseY) != null){
           p = peg.clicked(mouseX, mouseY);
        }
      }
    }
    else{
      for(Peg peg : this.blackPegs){
        if(peg.clicked(mouseX, mouseY) != null){
           p = peg.clicked(mouseX, mouseY);
        }
      }
    }
    if(p != null){
      p.show();
      if(this.prev == null){
        if(!p.selected){
          p.makeSelect();
          this.prev = p;
        }
      }
      else if(this.prev == p){
        p.disableSelect();
        this.prev = null;
      }
    }else{
      if(this.prev != null){
        if(this.prev.selected){
          PVector nearPoint = this.findNear(mouseX, mouseY);
          //print(nearPoint);
          if(nearPoint != null){
            prev.move(nearPoint.x, nearPoint.y);
          }
          this.prev.disableSelect();
          this.prev = null;
          this.currMove = !this.currMove;
        }
      }
    }
  }
}
