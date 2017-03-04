class Token extends GameObject{
  PImage image;
  float x, y;
  float xSize, ySize;
  
  Token(String imageName, float xSize, float ySize) {
    image = loadImage(imageName);
    x = 0;
    y = 0;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  void render(float x, float y, float xSize, float ySize) {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    image(image, xSize, ySize);
    popMatrix();
  }
}