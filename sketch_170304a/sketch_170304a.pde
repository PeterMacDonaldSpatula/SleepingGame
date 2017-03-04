Test card;
Players players;

void setup() {
  size(600, 600);
  card = new Test();
  players = new Players();
}

void draw() {
  background(#000000);
  card.renderBack(100, 100, 70, 100);
  card.render(300, 100, 70, 100);
}