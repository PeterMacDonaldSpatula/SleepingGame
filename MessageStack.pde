class MessageStack {
  Message head;
  
  MessageStack() {
    head = null;
  }
  
  void pushMessage(Message message) {//Adds a message to the top of the stack
    message.next = head;
    head = message;
  }
  
  void pushMessage(String message) {//Adds a message to the top of the stack
    Message temp = new Message(message);
    temp.next = head;
    head = temp;
  }
  
  void popMessage() {//removes the top message from the stack
    if (head!=null) {
      head = head.next;
    } 
  }
}