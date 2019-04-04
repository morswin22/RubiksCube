void turnZ(int index, boolean clockwise) {
  Config[] configs = new Config[8];
  for (int i = 0; i < order.length; i++) {
    int a = order[i].a;
    int b = order[i].b;
    configs[i] = cube[a][b][index].config.copy();
    configs[i].rotateZ(clockwise);
  }
  
  for (int i = 0; i < order.length; i++) {
    int a = order[i].a;
    int b = order[i].b;
    if (!clockwise) {
      cube[a][b][index].config = configs[(i + 2) % order.length];
    } else {
      cube[a][b][index].config = configs[(i + order.length - 2) % order.length];
    }
  }
}

void turnY(int index, boolean clockwise) {
  Config[] configs = new Config[8];
  for (int i = 0; i < order.length; i++) {
    int a = order[i].a;
    int b = order[i].b;
    configs[i] = cube[a][index][b].config.copy();
    configs[i].rotateY(clockwise);
  }
  
  for (int i = 0; i < order.length; i++) {
    int a = order[i].a;
    int b = order[i].b;
    if (!clockwise) {
      cube[a][index][b].config = configs[(i + 2) % order.length];
    } else {
      cube[a][index][b].config = configs[(i + order.length - 2) % order.length];
    }
  }
}

void turnX(int index, boolean clockwise) {
  Config[] configs = new Config[8];
  for (int i = 0; i < order.length; i++) {
    int a = order[i].a;
    int b = order[i].b;
    configs[i] = cube[index][a][b].config.copy();
    configs[i].rotateX(clockwise);
  }
  
  for (int i = 0; i < order.length; i++) {
    int a = order[i].a;
    int b = order[i].b;
    if (!clockwise) {
      cube[index][a][b].config = configs[(i + 2) % order.length];
    } else {
      cube[index][a][b].config = configs[(i + order.length - 2) % order.length];
    }
  }
}

void move(char which, int dir) {
  if (which == 'u' && dir == 1) {
    turnY(0,CLOCKWISE);
  } else if (which == 'u' && dir == -1) {
    turnY(0,COUNTER_CLOCKWISE);
  } else if (which == 'd' && dir == 1) {
    turnY(2,COUNTER_CLOCKWISE);
  } else if (which == 'd' && dir == -1) {
    turnY(2,CLOCKWISE);
  } else if (which == 'r' && dir == 1) {
    turnX(2,CLOCKWISE);
  } else if (which == 'r' && dir == -1) {
    turnX(2,COUNTER_CLOCKWISE);
  } else if (which == 'l' && dir == 1) {
    turnX(0,COUNTER_CLOCKWISE);
  } else if (which == 'l' && dir == -1) {
    turnX(0,CLOCKWISE);
  } else if (which == 'f' && dir == 1) {
    turnZ(2,CLOCKWISE);
  } else if (which == 'f' && dir == -1) {
    turnZ(2,COUNTER_CLOCKWISE);
  } else if (which == 'b' && dir == 1) {
    turnZ(0,CLOCKWISE);
  } else if (which == 'b' && dir == -1) {
    turnZ(0,COUNTER_CLOCKWISE);
  }
}


class Index {
  int a, b;
  
  Index(int a_, int b_) {
    a = a_;
    b = b_;
  }
}

Index[] order = {
  new Index(0,0),
  new Index(1,0),
  new Index(2,0),
  new Index(2,1),
  new Index(2,2),
  new Index(1,2),
  new Index(0,2),
  new Index(0,1)
};


//void turnZ(int index, boolean clockwise) {
//  //Config[] configs = new Config[8];
//  for (int i = 0; i < order.length; i++) {
//    int a = order[i].a;
//    int b = order[i].b;
//    cube[a][b][index].config.rotateZ(clockwise);
//    //configs[i] = cube[a][b][2].config.copy();
//    //configs[i].rotateZ();
//  }
  
//  //for (int i = 0; i < order.length; i++) {
//  //  int a = order[i].a;
//  //  int b = order[i].b;
//  //  cube[a][b][2].config = configs[(i + 2) % order.length];
//  //}
//}
