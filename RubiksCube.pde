import peasy.*;
PeasyCam cam;

char[] moves = {'u', 'U', 'd', 'D', 'f', 'F', 'b', 'B', 'l', 'L', 'r', 'R'};

boolean shuffle = false;

final int U = 0;
final int D = 1;
final int R = 2;
final int L = 3;
final int F = 4;
final int B = 5;
final boolean CLOCKWISE = true;
final boolean COUNTER_CLOCKWISE = false;

                // UP,     DOWN,    RIGHT,   LEFT,    FRONT,    BACK
color[] colors = {#FFFF00, #FFFFFF, #FFA500, #FF0000, #00FF00, #0000FF, #000000};

int dim = 3;
Cubie[][][] cube = new Cubie[dim][dim][dim];

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        float len = 50;
        float offset = (dim-1) * len * 0.5;
        float x = len * i - offset;
        float y = len * j - offset;
        float z = len * k - offset;
        
        cube[i][j][k] = new Cubie(x,y,z, len);
        
      }
    }
  }
  //cube[0][0][2].highlight();
}

void keyPressed() {
  move(key);
  if (key == ' ') {
    shuffle = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    shuffle = false;
  }
}

void draw() {
  background(220);
  rotateX(-0.35);
  rotateY(0.35);
  //rotateZ(0.1);
  
  if (shuffle && frameCount % 10 == 0) {
    int r = int(random(moves.length));
    move(moves[r]);
    println(moves[r]);
  }
  
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        cube[i][j][k].show();
      }
    }
  }
  
  //fill(255);
  //text(latestMove, 40, 40);
  
  //if (frameCount % 10 == 0) {
  //  turnZ(2,CLOCKWISE);
  //} else if (frameCount % 10 == 5) {
  //  turnX(0,CLOCKWISE);
  //}
}
