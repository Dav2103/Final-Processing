import processing.serial.*;

Serial myPort;

Motor motor;

void setup() {
  size(400, 200); // Aumentamos el tamaño de la ventana
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  textAlign(CENTER, CENTER);
  
  motor = new Motor();
}

void draw() {
  background(200);
  
  motor.display();
}

void mousePressed() {
  motor.checkButtons();
}

class Motor {
  void display() {
    // Botón de encender
    if (mouseX > 50 && mouseX < 200 && mouseY > 50 && mouseY < 150) { // Aumentamos el tamaño del botón
      fill(0, 255, 0);
    } else {
      fill(0, 200, 0);
    }
    rect(50, 50, 150, 100); // Aumentamos las dimensiones del botón
    fill(0);
    textSize(24); // Aumentamos el tamaño del texto
    text("ON", 125, 100); // Centramos el texto en el botón

    // Botón de apagar
    if (mouseX > 250 && mouseX < 400 && mouseY > 50 && mouseY < 150) { // Aumentamos el tamaño del botón
      fill(255, 0, 0);
    } else {
      fill(200, 0, 0);
    }
    rect(250, 50, 150, 100); // Aumentamos las dimensiones del botón
    fill(0);
    text("OFF", 325, 100); // Centramos el texto en el botón
  }
  
  void checkButtons() {
    if (mouseX > 50 && mouseX < 200 && mouseY > 50 && mouseY < 150) {
      myPort.write('E');
    }
    if (mouseX > 250 && mouseX < 400 && mouseY > 50 && mouseY < 150) {
      myPort.write('A');
    }
  }
}
