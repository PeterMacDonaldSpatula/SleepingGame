Deck normalDeck, exhaustionDeck;
ArrayList<Card> normalDiscard, exhaustionDiscard;
MessageStack messages;
Players players;
int day;
final static int MAX_DAYS = 7;
final static int MAX_EXHAUSTION = 3;
final static int VICTORY_COST = 5;
boolean gameOver;
Board board;
PImage decoBed;

void setup() {
  gameOver = false;
  size(900, 600);
  players = new Players();
  messages = new MessageStack();
  day = 1;
  players.players[0] = new Player(0);
  players.players[1] = new Player(1);
  players.players[2] = new Player(2);
  players.players[3] = new Player(3);
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
  
  decoBed = loadImage("data/bed.jpg");
  board = new Board(20, 2);
}

void keyPressed(){
  if(keyCode == 'W'){
    board.players.get(0).moveForward(1);
  }
  if(keyCode == 'S'){
    board.players.get(0).moveBack(1);
  }
  if(keyCode == 'E'){
    board.players.get(1).moveForward(1);
  }
  if(keyCode == 'D'){
    board.players.get(1).moveBack(1);
  }
}

void mousePressed() {
  if (messages.head != null) {//If there's a message waiting to be dismissed, pop it off the stack
    messages.popMessage();
  }
}

void draw() {
  background(#000000);
  image(decoBed, 855, 550);
  board.draw();
  
  
  if (messages.head != null) {//Leave this at the end of the draw function, so it overwrites the other stuff on the screen
    messages.head.show();
  }
  
  if (gameOver && messages.head == null) {
    exit();
  }
  
}