void initMoves() {
  allMoves[0] = new Move('u', 1, -1, 0, -1);
  allMoves[1] = new Move('u', -1, -1, 0, -1);
  allMoves[2] = new Move('d', 1, -1, 2, -1);
  allMoves[3] = new Move('d', -1, -1, 2, -1);
  allMoves[4] = new Move('r', 1, 2, -1, -1);
  allMoves[5] = new Move('r', -1, 2, -1, -1);
  allMoves[6] = new Move('l', 1, 0, -1, -1);
  allMoves[7] = new Move('l', -1, 0, -1, -1);
  allMoves[8] = new Move('f', 1, -1, -1, 2);
  allMoves[9] = new Move('f', -1, -1, -1, 2);
  allMoves[10] = new Move('b', 1, -1, -1, 0);
  allMoves[11] = new Move('b', -1, -1, -1, 0);
  
  
  for(int i = 0; i<allMoves.length; i++) {
    char ki = allMoves[i].which;
    if (allMoves[i].dir == -1) {
      ki = Character.toUpperCase(ki);
    }
    keys[i] = ki;
  }
  
  println(keys);
}

class Move {
  char which;
  int dir = 1;
  float angle = 0;
  boolean animating = false;
  int i, j, k;
  
  void start() {
    angle = 0;
    animating = true;
  }
  
  void execute() {
    move(which, dir);
  }
  
  void update() {
    if (animating) {
      angle += 0.05*dir;
      if (dir < 0) {
        println("Added "+(0.05*dir)+" so its "+angle+" and is it lesser than "+(-HALF_PI));
        if (angle <= -HALF_PI) {
          animating = false;
          execute();
        }
      } else {
        println("Added "+(0.05*dir)+" so its "+angle+" and is it greater than "+HALF_PI);
        if (angle >= HALF_PI) {
          animating = false;
          execute();
        }
      }
    }
  }
  
  Move(char c, int dir_, int i_, int j_, int k_) {
    which = c;
    dir = dir_;
    i = i_;
    j = j_;
    k = k_;
  }
  
  Move reverse() {
    return new Move(which, dir * -1, i, j, k);
  }
}
