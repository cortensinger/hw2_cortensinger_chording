
SYSTEM_MODE(MANUAL); 


// Digital button switches -- One for each finger
int pinky = 0;
int ring = 0;
int middle = 0;
int ind = 0;
int thumb = 0;

// Incoming serial byte
int inByte = 0;

void setup() {
  Serial.begin(9600);
  while(!Serial);

  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  
  establishContact();
}

void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    thumb = digitalRead(3);
    delay(10);
    ind = digitalRead(4);
    delay(10);
    middle = digitalRead(5);
    delay(10);
    ring = digitalRead(6);
    delay(10);
    pinky = digitalRead(7);
    delay(10);

    Serial.write(pinky);
    Serial.write(ring);
    Serial.write(middle);
    Serial.write(ind);
    Serial.write(thumb);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');
    delay(300);
  }
}
