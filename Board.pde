class Board{
  int numSpaces, numPlayers;
  ArrayList<Space> spaces;
  ArrayList<Player> players;
  
  Board(int numSpaces, int numPlayers){
    this.numSpaces = numSpaces;
    this.numPlayers = numPlayers;
    players = new ArrayList<Player>(numPlayers);
    spaces = new ArrayList<Space>(numSpaces);
    
    for(int i = 0; i < numPlayers; i++){
      players.add(new Player(i));
    }
    int tempx = 30;
    for(int i = 0; i < numSpaces; i++){
      spaces.add(new Space(tempx, 530, i));
      tempx += 40;
    }
    
  }
  void draw(){
    for(int i = 0; i < numSpaces; i++){
      spaces.get(i).draw();
      for(int j = 0; j < numPlayers; j++){
        if(players.get(j).pos == spaces.get(i).pos){
          players.get(j).token.render(spaces.get(i).x, spaces.get(i).y + players.get(j).yOff);
        }
      }
    }
    
    
  }
}

class Space{
  int x,y, pos;
  int spaceWidth, spaceHeight;
  PImage image = new PImage();
  
  Space(int x, int y, int pos){
    this.x = x;
    this.y = y;
    this.pos = pos;
    this.spaceWidth = 20;
    this.spaceHeight = 40;
  }
  void draw(){
    fill(56, 205, 255);
    rect(x,y,spaceWidth,spaceHeight);
  }
}