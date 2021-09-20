class Board {
  int size;
  PVector[] blocks;
  ArrayList<Peg> whitePegs;
  ArrayList<Peg> blackPegs;
  public Board(int size) {
    this.size = size;
    this.blocks = new PVector[25];
    this.whitePegs = new ArrayList<Peg>();
    this.blackPegs = new ArrayList<Peg>();
    this.setBlocks();
    this.printBlocks();
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
}
