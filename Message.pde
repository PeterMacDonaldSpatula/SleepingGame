class Message {
  String message;
  Message next;
  
  Message(String string) {
    message = string;
    next = null;
  }
  
  void show() {//Displays the message to the screen
    background(#000000);
    fill(#FFFFFF);
    textAlign(CENTER);
    textSize(30);
    text(message + "\n\nClick to dismiss this message.", 100, 100, 400, 400);
  }
}