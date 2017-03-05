Deck normalDeck, exhaustionDeck;
ArrayList<Card> normalDiscard, exhaustionDiscard;
MessageStack messages;
Players players;
int day;
final static int MAX_DAYS = 7;
final static int MAX_EXHAUSTION = 3;
final static int VICTORY_COST = 5;
boolean gameOver;

void setup() {
  gameOver = false;
  size(600, 600);
  players = new Players();
  messages = new MessageStack();
  day = 1;
  players.players[0] = new Player(new Token("greenPawn.png", 50, 50), "Player 1");
  players.players[1] = new Player(new Token("redPawn.png", 50, 50), "Player 2");
  players.players[2] = new Player(new Token("bluePawn.png", 50, 50), "Player 3");
  players.players[3] = new Player(new Token("pinkPawn.png", 50, 50), "Player 3");
  for (int i=0; i < int(random(0, 4)); i+=1) {//This is to randomize the starting player
    players.advancePlayers();
  }
  
  ArrayList<Card> temp = new ArrayList<Card>();//Set up the Normal deck
  for (int i = 0; i<50; i+=1) {
    temp.add(new NormalCard());
  }
  normalDeck = new Deck(temp);
  
  temp = new ArrayList<Card>();//Set up the exhaustion deck
  for (int i = 0; i<50; i+=1) {
    temp.add(new ExhaustionCard());
  }
  exhaustionDeck = new Deck(temp);
  
  normalDiscard = new ArrayList<Card>();
  exhaustionDiscard = new ArrayList<Card>();
  messages.pushMessage("Testing");
}

void mousePressed() {
  if (messages.head != null) {//If there's a message waiting to be dismissed, pop it off the stack
    messages.popMessage();
  }
}

void draw() {
  background(#000000);
  
  
  
  if (messages.head != null) {//Leave this at the end of the draw function, so it overwrites the other stuff on the screen
    messages.head.show();
  }
  
  if (gameOver && messages.head == null) {
    exit();
  }
  
}