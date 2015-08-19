int base = 20;
int x, y, score = 0;
int changeX = 1;
int changeY = 1;
boolean gameOver = false;

void setup() {
  size(500, 500);
  x = (int) random(width);
  y = height - base;
  changeX = -8;
  changeY = -5;
}

void draw() {
  if (!gameOver) {
    background(#33334C);
    textSize(16);
    text("Simple Bounce Game", width/2, 40);
    text("Score:" + score, 40, 40);
    float constrain = constrain(mouseX, 0, width-100);
    fill(#99CCFF);
    rect(constrain, height-base, 100, base);
    fill(#A2B8CF);
    ellipse(x, y, 20, 20);
    x=x+changeX;
    y=y+changeY;

    if (x<0) {
      changeX=-changeX;
    } else if (x>width) {
      changeX=-changeX;
    }
    if (y < 0 + 10) {
      changeY=-changeY;
    }
    if (y>height-10) {
      if ((x+10) > mouseX && (x-10) < mouseX + 100 ) {
        changeY=-changeY; // bounce
        score++;
      } else {
        gameOver = true;
      }
    }
  } else {
    background(#52663D);
    textSize(40);
    text("Game Over!", width/2 - 110, height/2 - 100);
    text("Your Score: " + score, width/2-120, height/2-60);
    text("Click to Restart", width/2-145, height/2-20);
  }
}

void mouseClicked() {
  changeY=-changeY;
  gameOver = false;
  score = 0;
}

