import peasy.*;
PeasyCam cam;

final int UPP = 0;
final int DWN = 1;
final int RGT = 2;
final int LFT = 3;
final int FRT = 4;
final int BCK = 5;

                // UP,     DOWN,    RIGHT,   LEFT,    FRONT,    BACK
color[] colors = {#FFFFFF, #FFFF00, #FF0000, #FFAA00, #00FF00, #0000FF};

int dim = 3;
Box[][][] cubie = new Box[dim][dim][dim];

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
        
        cubie[i][j][k] = new Box(x,y,z, len);
        
      }
    }
  }
}

void draw() {
  background(220);
  
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        cubie[i][j][k].show();
      }
    }
  }
}
