import processing.serial.*;
PFont F;
PImage a, b, c, d, e, f, g, h, i, j, k, l, m,
       n, o, p, q, r, s, t, u, v, w, x, y, z, 
       none, space, del, exclaim, comma, blank, enter;
String letter;
int lag = 180, lagg = 200;
int inByte, serialCount = 0;
int handX = 380, handY = 450;
int textX, textY, countX = 0, countY = 0;
int margin = 40, xGap = 30, yGap = 50;
int pinky, ring, middle, index, thumb;
int[] serialInArray = new int[5];
boolean firstContact = false;
Serial myPort;

void setup() {
  fullScreen();
  background(0x3498db);
  F = loadFont("Courier-Bold-48.vlw");
  textFont(F);
  textAlign(CENTER, CENTER);
  textX = yGap;
  textY = yGap;
  
  a = loadImage("00001.png");
  b = loadImage("00010.png");
  c = loadImage("00011.png");
  d = loadImage("00100.png");
  e = loadImage("00101.png");
  f = loadImage("00110.png");
  g = loadImage("00111.png");
  h = loadImage("01000.png");
  i = loadImage("01001.png");
  j = loadImage("01010.png");
  k = loadImage("01011.png");
  l = loadImage("01100.png");
  m = loadImage("01101.png");
  n = loadImage("01110.png");
  o = loadImage("01111.png");
  p = loadImage("10000.png");
  q = loadImage("10001.png");
  r = loadImage("10010.png");
  s = loadImage("10011.png");
  t = loadImage("10100.png");
  u = loadImage("10101.png");
  v = loadImage("10110.png");
  w = loadImage("10111.png");
  x = loadImage("11000.png");
  y = loadImage("11001.png");
  z = loadImage("11010.png");
  none = loadImage("00000.png");
  space = loadImage("11111.png");
  del = loadImage("11110.png");
  exclaim = loadImage("11011.png");
  comma = loadImage("11100.png");
  enter = loadImage("11101.png");
  blank = loadImage("del.png");
  
  
  // Debugging Serial Ports
  // println(Serial.list());
  String portName = Serial.list()[1];
  println(portName);
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  helper();
}


void serialEvent(Serial myPort) {
  inByte = myPort.read();

  // look for our 'A' string to start the handshake
  // if it's there, clear the buffer, and send a request for data
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();
      firstContact = true;
      myPort.write('A');
      println("contact");
    }
  } else {
    serialInArray[serialCount] = inByte;
    serialCount += 1;
      if (serialCount > 4) {
        pinky = serialInArray[0];
        ring = serialInArray[1];
        middle = serialInArray[2];
        index = serialInArray[3];
        thumb = serialInArray[4];
        myPort.write('A');
        serialCount = 0;
        if (pinky == 0) {
          if (ring == 0) {
            if (middle == 0) {
              if (index == 0) {
                if (thumb == 0) {
                  show(none);
                } else {
                  show(a);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(b);
                } else {
                  show(c);
                }
              }
            } else if (middle == 1) {
              if (index == 0) {
                if (thumb == 0) {
                  show(d);
                } else {
                  show(e);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(f);
                } else {
                  show(g);
                }
              }
            }
          } else if (ring == 1) {
            if (middle == 0) {
              if (index == 0) {
                if (thumb == 0) {
                  show(h);
                } else {
                  show(i);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(j);
                } else {
                  show(k);
                }
              }
            } else if (middle == 1) {
              if (index == 0) {
                if (thumb == 0) {
                  show(l);
                } else {
                  show(m);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(n);
                } else {
                  show(o);
                }
              }
            }
          }
        } else if (pinky == 1) {
          if (ring == 0) {
            if (middle == 0) {
              if (index == 0) {
                if (thumb == 0) {
                  show(p);
                } else {
                  show(q);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(r);
                } else {
                  show(s);
                }
              }
            } else if (middle == 1) {
              if (index == 0) {
                if (thumb == 0) {
                  show(t);
                } else {
                  show(u);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(v);
                } else {
                  show(w);
                }
              }
            }
          } else if (ring == 1) {
            if (middle == 0) {
              if (index == 0) {
                if (thumb == 0) {
                  show(x);
                } else {
                  show(y);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(z);
                } else {
                  show(exclaim);
                }
              }
            } else if (middle == 1) {
              if (index == 0) {
                if (thumb == 0) {
                  show(comma);
                } else {
                  show(enter);
                }
              } else if (index == 1) {
                if (thumb == 0) {
                  show(del);
                } else {
                  show(space);
                }
              }
            }
          }
        }
      }
  }
}


void helper() {
  if (none(pinky, ring, middle, index, thumb)) {
  } else if (del(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (del(pinky, ring, middle, index, thumb)) {
      if ((countX == 0) && (countY > -1)) {
        countY -= 1;
        countX = 39;
        image(blank, textX + xGap*countX - 15, textY + yGap*countY - 20);
      } else {
        if (countY > -1) {
          countX -= 1;
        }
        image(blank, textX + xGap*countX - 15, textY + yGap*countY - 20);
      }
      delay(lagg);
    }
  } else if (ret(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (ret(pinky, ring, middle, index, thumb)) {
      countX = 0;
      countY += 1;
    }
    delay(lagg);
  } else if (space(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (space(pinky, ring, middle, index, thumb)) {
      type(" ");
    }
    delay(lagg);
  } else if (excl(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (excl(pinky, ring, middle, index, thumb)) {
      type("!");
    }
    delay(lagg);
  } else if (comm(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (comm(pinky, ring, middle, index, thumb)) {
      type(",");
    }
    delay(lagg);
  } else if (a(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (a(pinky, ring, middle, index, thumb)) {
      type("a");
    }
    delay(lagg);
  } else if (b(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (b(pinky, ring, middle, index, thumb)) {
      type("b");
    }
    delay(lagg);
  } else if (c(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (c(pinky, ring, middle, index, thumb)) {
      type("c");
    }
    delay(lagg);
  } else if (d(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (d(pinky, ring, middle, index, thumb)) {
      type("d");
    }
    delay(lagg);
  } else if (e(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (e(pinky, ring, middle, index, thumb)) {
      type("e");
    }
    delay(lagg);
  } else if (f(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (f(pinky, ring, middle, index, thumb)) {
      type("f");
    }
    delay(lagg);
  } else if (g(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (g(pinky, ring, middle, index, thumb)) {
      type("g");
    }
    delay(lagg);
  } else if (h(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (h(pinky, ring, middle, index, thumb)) {
      type("h");
    }
    delay(lagg);
  } else if (i(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (i(pinky, ring, middle, index, thumb)) {
      type("i");
    }
    delay(lagg);
  } else if (j(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (j(pinky, ring, middle, index, thumb)) {
      type("j");
    }
    delay(lagg);
  } else if (k(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (k(pinky, ring, middle, index, thumb)) {
      type("k");
    }
    delay(lagg);
  } else if (l(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (l(pinky, ring, middle, index, thumb)) {
      type("l");
    }
    delay(lagg);
  } else if (m(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (m(pinky, ring, middle, index, thumb)) {
      type("m");
    }
    delay(lagg);
  } else if (n(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (n(pinky, ring, middle, index, thumb)) {
      type("n");
    }
    delay(lagg);
  } else if (o(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (o(pinky, ring, middle, index, thumb)) {
      type("o");
    }
    delay(lagg);
  } else if (p(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (p(pinky, ring, middle, index, thumb)) {
      type("p");
    }
    delay(lagg);
  } else if (q(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (q(pinky, ring, middle, index, thumb)) {
      type("q");
    }
    delay(lagg);
  } else if (r(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (r(pinky, ring, middle, index, thumb)) {
      type("r");
    }
    delay(lagg);
  } else if (s(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (s(pinky, ring, middle, index, thumb)) {
      type("s");
    }
    delay(lagg);
  } else if (t(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (t(pinky, ring, middle, index, thumb)) {
      type("t");
    }
    delay(lagg);
  } else if (u(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (u(pinky, ring, middle, index, thumb)) {
      type("u");
    }
    delay(lagg);
  } else if (v(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (v(pinky, ring, middle, index, thumb)) {
      type("v");
    }
    delay(lagg);
  } else if (w(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (w(pinky, ring, middle, index, thumb)) {
      type("w");
    }
    delay(lagg);
  } else if (x(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (x(pinky, ring, middle, index, thumb)) {
      type("x");
    }
    delay(lagg);
  } else if (y(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (y(pinky, ring, middle, index, thumb)) {
      type("y");
    }
    delay(lagg);
  } else if (z(pinky, ring, middle, index, thumb)) {
    delay(lag);
    if (z(pinky, ring, middle, index, thumb)) {
      type("z");
    }
    delay(lagg);
  }
  
  if (countX == 40) {
    countX = 0;
    countY += 1;
  }
  
  if (countY == 15) {
    countY = 0;
    background(0x3498db);
  }
}


void show(PImage img) {
  image(img, handX, handY);
}

void type(String x) {
  text(x, textX + xGap*countX, textY + yGap*countY);
  countX += 1;
}

boolean none(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 0) && (i == 0) && (t == 0);
}

boolean del(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 1) && (i == 1) && (t == 0);
}

boolean ret(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 1) && (i == 0) && (t == 1);
}

boolean space(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 1) && (i == 1) && (t == 1);
}

boolean excl(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 0) && (i == 1) && (t == 1);
}

boolean comm(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 1) && (i == 0) && (t == 0);
}

boolean a(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 0) && (i == 0) && (t == 1);
}

boolean b(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 0) && (i == 1) && (t == 0);
}

boolean c(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 0) && (i == 1) && (t == 1);
}

boolean d(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 1) && (i == 0) && (t == 0);
}

boolean e(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 1) && (i == 0) && (t == 1);
}

boolean f(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 1) && (i == 1) && (t == 0);
}

boolean g(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 0) && (m == 1) && (i == 1) && (t == 1);
}

boolean h(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 0) && (i == 0) && (t == 0);
}

boolean i(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 0) && (i == 0) && (t == 1);
}

boolean j(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 0) && (i == 1) && (t == 0);
}

boolean k(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 0) && (i == 1) && (t == 1);
}

boolean l(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 1) && (i == 0) && (t == 0);
}

boolean m(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 1) && (i == 0) && (t == 1);
}

boolean n(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 1) && (i == 1) && (t == 0);
}

boolean o(int p, int r, int m, int i, int t) {
  return (p == 0) && (r == 1) && (m == 1) && (i == 1) && (t == 1);
}

boolean p(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 0) && (i == 0) && (t == 0);
}

boolean q(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 0) && (i == 0) && (t == 1);
}

boolean r(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 0) && (i == 1) && (t == 0);
}

boolean s(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 0) && (i == 1) && (t == 1);
}

boolean t(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 1) && (i == 0) && (t == 0);
}

boolean u(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 1) && (i == 0) && (t == 1);
}

boolean v(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 1) && (i == 1) && (t == 0);
}

boolean w(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 0) && (m == 1) && (i == 1) && (t == 1);
}

boolean x(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 0) && (i == 0) && (t == 0);
}

boolean y(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 0) && (i == 0) && (t == 1);
}

boolean z(int p, int r, int m, int i, int t) {
  return (p == 1) && (r == 1) && (m == 0) && (i == 1) && (t == 0);
}

//void keyPressed() {
//  int keyIndex = -2;
//  if (key >= 'a' && key <= 'z') {
//    keyIndex = key - 'a';
//  }
//  if (keyIndex == -1) {
//    image(none, handX, handY);
//  } else { 
//    switch(keyIndex) {
//    case 0:
//      image(a, handX, handY);
//      break;
//    case 1:
//      image(b, handX, handY);
//      break;
//    case 2:
//      image(c, handX, handY);
//      break;
//    case 3:
//      image(d, handX, handY);
//      break;
//    case 4:
//      image(e, handX, handY);
//      break;
//    case 5:
//      image(f, handX, handY);
//      break;
//    case 6:
//      image(g, handX, handY);
//      break;
//    case 7:
//      image(h, handX, handY);
//      break;
//    case 8:
//      image(i, handX, handY);
//      break;
//    case 9:
//      image(j, handX, handY);
//      break;
//    case 10:
//      image(k, handX, handY);
//      break;
//    case 11:
//      image(l, handX, handY);
//      break;
//    case 12:
//      image(m, handX, handY);
//      break;
//    case 13:
//      image(n, handX, handY);
//      break;
//    case 14:
//      image(o, handX, handY);
//      break;
//    case 15:
//      image(p, handX, handY);
//      break;
//    case 16:
//      image(q, handX, handY);
//      break;
//    case 17:
//      image(r, handX, handY);
//      break;
//    case 18:
//      image(s, handX, handY);
//      break;
//    case 19:
//      image(t, handX, handY);
//      break;
//    case 20:
//      image(u, handX, handY);
//      break;
//    case 21:
//      image(v, handX, handY);
//      break;
//    case 22:
//      image(w, handX, handY);
//      break;
//    case 23:
//      image(x, handX, handY);
//      break;
//    case 24:
//      image(y, handX, handY);
//      break;
//    case 25:
//      image(z, handX, handY);
//      break;
//    case 26:
//      image(none, handX, handY);
//      break;
//    case 27:
//      image(space, handX, handY);
//      break;
//    case 28:
//      image(comma, handX, handY);
//      break;
//    case 29:
//      image(del, handX, handY);
//      break;
//    case 30:
//      image(exclaim, handX, handY);
//      break;
//    default:
//      image(none, handX, handY);
//      break;
//    }
    
//    if (char(key) == 'z') {
//      if (countX == 0) {
//        countY -= 1;
//        countX = 39;
//        image(blank, textX + xGap*countX - 15, textY + yGap*countY - 20);
//      } else {
//        countX -= 1;
//        image(blank, textX + xGap*countX - 15, textY + yGap*countY - 20);
//      }
//    } else {
//      text(char(key), textX + xGap*countX, textY + yGap*countY);
//      countX += 1;
//    }
//    if (countX == 40) {
//      countX = 0;
//      countY += 1;
//    }
//  }
//}