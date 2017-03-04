class Player {
  final static int HAND_SIZE = 5;
  ArrayList<Card> hand;
  int handSize;
  int victoryPoints;
  int productivity;
  int actionPoints;
  Token token;
  
  Player(Token token) {
    hand = new ArrayList<Card>();
    handSize = HAND_SIZE;
    victoryPoints = 0;
    productivity = 0;
    actionPoints = 0;
    this.token = token;
  }
  
  void drawCard(Deck deck) {
    int temp = int(random(0,deck.cards.size()));
    hand.add(deck.cards.get(temp));
    deck.cards.remove(temp);
  }
}