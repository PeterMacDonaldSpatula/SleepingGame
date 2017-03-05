class Players {
  Player players[];
  boolean reachedBed;
  
  void advancePlayers() {
    Player temp[] = new Player[4];
    for (int i = 0; i<4; i+=1) {
      temp[i] = players[i];
    }
    players[1] = temp[0];
    players[2] = temp[1];
    players[3] = temp[2];
    players[0] = temp[3];
  }
  
  void startRound() {//Gets players started for a new round (draws their cards, resets their action points)
    for (int i = 0; i<4; i+=1) {
      players[i].actionPoints = 3;
      for (int j = 0; j<players[i].exhaustion; j+=1) {
        players[i].drawCard(exhaustionDeck);
      }
      for (int j = players[i].exhaustion; j<players[i].handSize; j+=1) {
        players[i].drawCard(normalDeck);
      }
    }
  }
  
  boolean checkRoundEnd() {//Checks if the round is over. If any player still has a valid play remaining to them, the round is not over
    int num=0;
    for (int i=0; i<4; i+=1) {
      if (!players[i].canPlay()) {
        num+=1;
      }
    }
    if (num==4) {
      return true;
    } else {
      return false;
    }
  }
  
  void roundEnd() {//Discards players' hands, checks if anyone has reached the bed, adds up the lateness scores, sees if the day is over
    for (int i=0; i<4; i+=1) {
      if (reachedBed && !players[i].inBed) {
        players[i].lateness+=1;
      }
    }
    
    for (int i=0; i<4; i+=1) {
      for (int j=0; j<players[i].hand.size(); j+=1) {
        players[i].hand.get(1).discard(players[i].hand);
        if (players[i].inBed) {
          reachedBed = true;
        }
      }
    }
    
    int count=0;
    for (int i = 0; i<4; i+=1) {
      if (players[i].inBed || players[i].lateness >=MAX_EXHAUSTION) {
        count+=1;
      }
    }
    if (count == 4 || (count > 0 && day == MAX_DAYS)) {//If all four are in bed OR if one is in bed and it's the last day, end the day
      dayEnd();
    }
  }
  
  void dayEnd() {
    int victoryGained = 0;
    for (int i = 0; i<4; i+=1) {
      victoryGained = players[i].productivity/VICTORY_COST;//Integer division, so any remainder is discarded.
      if (victoryGained > 0) {
        players[i].productivity-=(victoryGained * VICTORY_COST);
        players[i].victoryPoints+=victoryGained;
        messages.pushMessage(players[i].name + " traded in " + (victoryGained * VICTORY_COST) + " productivity, and received " + victoryGained + " progress points!");
      }
    }
    if (day < MAX_DAYS) {
      day += 1;
      startDay();
    } else {
      gameOver();
    }
  }
  
  void startDay() {
    for (int i=0;i<4; i+=1) {
      //Move token to starting position
      players[i].exhaustion = players[i].lateness;
      players[i].lateness = 0;
    }
    
  }
  
  void gameOver() {//Displays a final message and tells the game to end
    messages.pushMessage("Here are the final exam scores:\n\n" + players[0].name + ": " + (players[0].victoryPoints*10) + "%\n" + players[1].name + ": " + (players[1].victoryPoints*10) + "%\n" + players[2].name + ": " + (players[2].victoryPoints*10) + "%\n" + players[3].name + ": " + (players[3].victoryPoints*10) + "%\n");
    gameOver = true;
  }
  
  Players() {
    players = new Player[4];
    reachedBed = false;
  }
}