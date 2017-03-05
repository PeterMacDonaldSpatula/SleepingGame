class Player {
  final static int HAND_SIZE = 5;//THis is the default hand size
  String name;
  ArrayList<Card> hand;
  int handSize; //This is the actual hand size after any extra effects are resolved
  int victoryPoints;
  int productivity;
  int actionPoints;
  int exhaustion;
  int lateness;
  boolean inBed;
  Token token;
  
  Player(Token token, String name) {
    hand = new ArrayList<Card>();
    handSize = HAND_SIZE;
    victoryPoints = 0;
    productivity = 0;
    actionPoints = 0;
    exhaustion = 0;
    lateness = 0;
    inBed = false;
    this.token = token;
    this.name = name;
  }
  
  boolean canPlay() {//Returns true if the player still has plays available to them, otherwise false
    for (int i=0; i<hand.size(); i+=1) {
      if (hand.get(i).cost < actionPoints) {
        return true;
      }
    }
    return false;
  }
  
  void drawCard(Deck deck) {//Draws a card from the passed-in deck
    int temp = int(random(0,deck.cards.size()));
    hand.add(deck.cards.get(temp));
    deck.cards.remove(temp);
  }
}