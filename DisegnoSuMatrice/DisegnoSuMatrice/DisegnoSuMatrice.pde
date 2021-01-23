Griglia g;
public void setup() {
  size(600, 600);
  g = new Griglia(width, height, 15, 15);
}

public void draw() {
  background(#eeeeee);
  g.disegna();
}

public void mousePressed() {
  g.clickMouse(mouseX, mouseY);
}
