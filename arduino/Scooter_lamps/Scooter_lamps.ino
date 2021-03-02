#define LED_PCB 17
#define LED_LEFT 2
#define LED_RIGHT 3
#define LED_STOP 4
#define LED_BLINK 5 // Always blinks like left/right leds
#define LED_STROBE 6 // Always strobe like stop
#define SPK 7

uint8_t tt;

void setup() {
  Serial.begin(9600);
  pinMode(LED_PCB, OUTPUT);
  pinMode(LED_LEFT, OUTPUT);
  pinMode(LED_RIGHT, OUTPUT);
  pinMode(LED_STOP, OUTPUT);
  pinMode(LED_BLINK, OUTPUT);
  pinMode(LED_STROBE, OUTPUT);
  pinMode(SPK, OUTPUT);
  tt = 0;
}

void leftSnd(bool state) {
  static bool st = state;
  if (state != st) {
    st = state;
    if (state) {
      tone(SPK, 1000, 10);
    } else {
      tone(SPK, 800, 10);
    }
  }  
}

void rightSnd(bool state) {
  static bool st = state;
  if (state != st) {
    st = state;
    if (state) {
      tone(SPK, 900, 10);
    } else {
      tone(SPK, 700, 10);
    }
  }  
}

void loop() {
  tt += 1;
  uint16_t s1 = analogRead(A0);
  uint16_t s2 = analogRead(A1);
  uint16_t s3 = analogRead(A2);

/*
  Serial.print(s1);
  Serial.print(" ");
  Serial.print(s2);
  Serial.print(" ");
  Serial.print(s3);
  Serial.println(" ");
  Serial.println(tt);
*/
  
  if (s1 < 100) {
    if ((tt / 2) % 2)
      digitalWrite(LED_STOP, HIGH);
    else
      digitalWrite(LED_STOP, LOW);  
  } else {
    digitalWrite(LED_STOP, LOW);  
  }

  if ((tt / 2) % 2)
    digitalWrite(LED_STROBE, HIGH);
  else
    digitalWrite(LED_STROBE, LOW);  

  if (s2 < 100) {
    if ((tt / 8) % 2) {
      leftSnd(true);
      digitalWrite(LED_LEFT, HIGH);
    } else {
      leftSnd(false);
      digitalWrite(LED_LEFT, LOW);
    }
  } else {
      leftSnd(false);
      digitalWrite(LED_LEFT, LOW);  
  }

  if (s3 < 100) {
    if ((tt / 8) % 2) {
      rightSnd(true);
      digitalWrite(LED_RIGHT, HIGH);
    } else {
      rightSnd(false);
      digitalWrite(LED_RIGHT, LOW);
    }
  } else {
    rightSnd(false);
    digitalWrite(LED_RIGHT, LOW);  
  }

  if ((tt / 8) % 2)
    digitalWrite(LED_BLINK, HIGH);
  else
    digitalWrite(LED_BLINK, LOW);  

  delay(100);
}
