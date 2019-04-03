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

void move(char key) {
  switch(key) {
    case 'f':
      turnZ(2,CLOCKWISE);
      break;
    case 'F':
      turnZ(2,COUNTER_CLOCKWISE);
      break;
    case 'b':
      turnZ(0,COUNTER_CLOCKWISE);
      break;
    case 'B':
      turnZ(0,CLOCKWISE);
      break;
      
    case 'l':
      turnX(0,COUNTER_CLOCKWISE);
      break;
    case 'L':
      turnX(0,CLOCKWISE);
      break;
    case 'r':
      turnX(2,CLOCKWISE);
      break;
    case 'R':
      turnX(2,COUNTER_CLOCKWISE);
      break;
      
    case 'u':
      turnY(0,CLOCKWISE);
      break;
    case 'U':
      turnY(0,COUNTER_CLOCKWISE);
      break;
    case 'd':
      turnY(2,COUNTER_CLOCKWISE);
      break;
    case 'D':
      turnY(2,CLOCKWISE);
      break;
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
