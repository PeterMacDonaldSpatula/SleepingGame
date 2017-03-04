class Players {
  Player players[];
  
  void advancePlayers() {
    Player temp[] = new Player[4];
    for (int i = 0; i<4; i+=1) {
      temp[i] = players[i];
    }
    players[2] = temp[1];
    players[3] = temp[2];
    players[4] = temp[3];
    players[1] = temp[4];
  }
  
  Players() {
    players = new Player[4];
  }
}