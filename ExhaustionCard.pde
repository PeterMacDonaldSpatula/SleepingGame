class ExhaustionCard extends Card {
  ExhaustionCard() {
    super();
    name = "Exhaustion";
    cost = 1;
  }
  
  void play(){}
  
  void discard(ArrayList<Card> hand) {
    exhaustionDiscard.add(this);
    hand.remove(this);
  }
}