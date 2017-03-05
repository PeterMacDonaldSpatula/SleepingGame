class Token{
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
  
  void render() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    image(image, 0, 0, xSize, ySize);
    popMatrix();
  }
  
  void render(float x, float y) {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    image(image, 0, 0, xSize, ySize);
    popMatrix();
  }
  
  void render(float x, float y, float xSize, float ySize) {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    image(image, 0, 0, xSize, ySize);
    popMatrix();
  }
}