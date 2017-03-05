class NormalCard extends Card {
  NormalCard() {
    super();
    name = "Normal";
    cost = 1;
  }
  
  void play(){}
  
  void discard(ArrayList<Card> hand) {
    normalDiscard.add(this);
    hand.remove(this);
  }
}