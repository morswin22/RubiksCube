import peasy.*;
PeasyCam cam;

Move[] allMoves = new Move[12];

boolean shuffle = false;
boolean unshuffle = false;

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

ArrayList<Move> sequence = new ArrayList<Move>();

Move currentMove = new Move('f', 1, -1, -1, 2);

void setup() {
  size(600, 600, P3D);
  initMoves();
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
  //move(key);
  if (key == ' ') {
    shuffle = true;
    unshuffle = false;
  }
  if (key == '\\') {
    shuffle = false;
    unshuffle = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    shuffle = false;
  }
  if (key == '\\') {
    unshuffle = false;
  }
}

void draw() {
  background(220);
  rotateX(-0.35);
  rotateY(0.35);
  //rotateZ(0.1);
  
  if (frameCount % 10 == 0) {
    if (shuffle && !unshuffle && !currentMove.animating) {
      int r = int(random(allMoves.length));
      Move m = allMoves[r];
      currentMove = m;
      currentMove.start();
      sequence.add(m);
      println(m.which, m.dir);
    } else if (unshuffle && !shuffle && !currentMove.animating) {
      if (!sequence.isEmpty()) {
        Move m = sequence.remove(sequence.size() - 1);
        Move nextMove = m.reverse();
        currentMove = nextMove;
        currentMove.start();
        println(nextMove.which, nextMove.dir);
      }
    }
  }
  
  currentMove.update();
  
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        if (currentMove.animating) {
          push();
          if (currentMove.k != -1 && k == currentMove.k) {
            rotateZ(currentMove.angle);
          } else if (currentMove.j != -1 && j == currentMove.j) {
            rotateY(currentMove.angle);
          } else if (currentMove.i != -1 && i == currentMove.i) {
            rotateX(currentMove.angle);
          }
          cube[i][j][k].show();
          pop();
        } else {
          cube[i][j][k].show();
        }
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
