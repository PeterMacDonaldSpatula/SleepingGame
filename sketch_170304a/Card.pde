abstract class Card extends GameObject{
  String name;
  PImage back;
  
  Card() {
    name = "Placeholder";
    back = loadImage("normalBack.png");
  }
  
  abstract void play();
  
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