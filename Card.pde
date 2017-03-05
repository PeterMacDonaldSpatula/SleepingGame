abstract class Card{
  String name;
  int cost;
  PImage back, front;
  boolean mouseOver;
  int id;
  
  Card() {
    name = "Placeholder";
    cost = 0;
    back = loadImage("normalBack.png");
  }
  
  Card(String name, int id) {
    this.name = name;
    this.id = id;
    back = loadImage("normalBack.png");
    front = loadImage("data/card"+id+".png");
    mouseOver = false;
}
  
  abstract void play();
  
  abstract void discard(ArrayList<Card> hand);
  
  void render(float x, float y, float xSize, float ySize) {
    fill(#D1891E);
    noStroke();
    rect(x, y, xSize, ySize);
    textAlign(CENTER);
    stroke(#FFFFFF);
    fill(#FFFFFF);
    text(name, x, y, xSize, ySize);
  }
  
  void renderBack(float x, float y, float xSize, float ySize) {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    image(back, x, y, xSize, ySize);
    popMatrix();
  }
}