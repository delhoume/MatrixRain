
int numLines;
int[] line_pos;
int[] line_length;
int[] line_speed;

int width = 1920;
int height = 1024;

int line_width = 17;
int char_height = 18;

int min_line_length = 10;
int max_line_length = 50;

int min_line_speed = 1;
int max_line_speed = 10;

PFont font;

void setup() {
  size(1920, 1024);
//  frameRate(25);
  numLines = width / line_width;
  
  line_pos = new int[numLines];
  line_length = new int[numLines];
  line_speed = new int[numLines];
  
  for (int l = 0; l < numLines; ++l) {
    lineUpdate(l);
  }
  
  font = loadFont("YuGothicUI-Regular-14.vlw");
  textFont(font);
}

void lineUpdate(int lineNum) {
    line_length[lineNum] = (int)random(min_line_length, max_line_length);
    line_pos[lineNum] = setYPos(line_length[lineNum]);
    line_speed[lineNum] = (int)random(min_line_speed, max_line_speed);
}

void lineDraw(int lineNum) {
  int startX = lineNum * line_width;
  int currentY = 0;
  for(int i = 0; i < line_length[lineNum]; i++) {
    int green = (int)map(i, 0, line_length[lineNum], 25, 255);    
    fill(0, green, 0);
    text(getUnicodeChar(), startX, line_pos[lineNum] + currentY);   
    currentY = (i * char_height);
  }  

  // last one (white)
    fill(255);
    text(getUnicodeChar(), startX, line_pos[lineNum] + currentY); 
    
  line_pos[lineNum] += line_speed[lineNum];
  if (line_pos[lineNum] >= height){
    lineUpdate(lineNum);
  } 
}

int setYPos(int line_length) {
  return line_length * -20;
}

char getUnicodeChar() {
  // some ascii most hiragana
  int codepoint = (int)random(0, 10) == 0 ? (int)random(65, 91) : (int)random(12353, 12438);
  return char(codepoint);
 }

void draw() {
  background(0);
  for (int l = 0; l < numLines; l++) {
      lineDraw(l);
    }
}
