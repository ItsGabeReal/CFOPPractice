PFont mainFont; //<>//
String practiceType = "pll"; // Either "oll" or "pll" and determines which one we're practicing
boolean singlePress = false; // True for 1 frame as soon as the mouse is pressed
boolean windowResized = false; // True for 1 frame when the window gets resized
int currentOLLAlgorithm = 0;
int currentPLLAlgorithm = 0;
int currentWidth, currentHeight; // To determine when the window's been resized
PImage linkIcon;
enum CursorShape {ARROW, HAND, TEXT}
CursorShape currentCursorShape = CursorShape.ARROW;

// Display Vars
color pieceYellow = color(255, 255, 0);
color pieceWhite = color(150);
color pieceRed = color(255, 0, 0);
color pieceGreen = color(0, 255, 0);
color pieceOrange = color(255, 125, 0);
color pieceBlue = color(0, 0, 255);
color checkboxRegular = color(0, 100, 255);
color checkboxHovered = color(25, 150, 255);
int selectionPanelWidth = 300;

void setup() {
  size(1280, 720);
  currentWidth = width;
  currentHeight = height;
  surface.setResizable(true);
  surface.setTitle("Algorithm Practice");
  surface.setIcon(loadImage("CubeVC.png"));
  
  mainFont = createFont("Montserrat-Bold.ttf", 30);
  textFont(mainFont);
  
  linkIcon = loadImage("LinkIcon.png");
  
  // Fill array with each oll algorithm
  ollAlgorithms = GetAllOLLAlgorithms();
  // Assign each oll algorithm an index
  for(int i = 0; i < ollAlgorithms.length; i++) {
    ollAlgorithms[i].index = i;
  }
  
  // Fill array with each pll algorithm
  pllAlgorithms = GetAllPLLAlgorithms();
  // Assign each pll algorithm an index
  for(int i = 0; i < pllAlgorithms.length; i++) {
    pllAlgorithms[i].index = i;
  }
  
  loadSaveFile();
}

void draw() {
  // Check if the window's been resized
  windowResized = (currentWidth != width || currentHeight != height);
  if(windowResized) { currentWidth = width; currentHeight = height; }
  
  // Default cursor type. Can be overridden with different type
  currentCursorShape = CursorShape.ARROW;
  
  background(10, 30, 50);
  
  // Algorithm display
  if(practiceType.equals("oll")) {
    ollAlgorithms[currentOLLAlgorithm].display(selectionPanelWidth + (width - selectionPanelWidth) / 2, height/2, false);
  }
  else {
    pllAlgorithms[currentPLLAlgorithm].display(selectionPanelWidth + (width - selectionPanelWidth) / 2, height/2, false);
  }
  
  // Tutorial text
  textSize(14);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Press SPACE to select a random checkmared algorithm", selectionPanelWidth + (width - selectionPanelWidth) * 0.4, 30);
  
  ModeSelection(width - 50);
  
  SelectionPanel(20, 20, selectionPanelWidth, height - 70);
  
  AlgorithmBox(400, height - 70, width - 400 - 200, 50, practiceType.equals("oll") ? ollAlgorithms[currentOLLAlgorithm].algorithm : pllAlgorithms[currentPLLAlgorithm].algorithm);
  
  videoButton(width - 20, height - 20, practiceType.equals("oll") ? ollAlgorithms[currentOLLAlgorithm].videoLink : pllAlgorithms[currentPLLAlgorithm].videoLink);
  
  singlePress = false;
  
  // Apply current cursor
  switch (currentCursorShape) {
    case ARROW:
      cursor(ARROW);
      break;
    case HAND:
      cursor(HAND);
      break;
    case TEXT:
      cursor(TEXT);
      break;
  }
}

void AlgorithmBox(int X, int Y, int Width, int Height, String Algorithm) {
  // Show Algorithm
  strokeWeight(2);
  stroke(0, 125, 255);
  fill(0, 100, 200, 200);
  rect(X, Y, Width, Height, 5);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(Algorithm, X + Width / 2, Y + Height / 2);
}

void videoButton(int X, int Y, String VideoLink) {
  int buttonWidth = 120;
  int buttonHeight = 50;
  
  boolean hoveringVideoButton = mouseX > X - buttonWidth && mouseX < X && mouseY > Y - buttonHeight && mouseY < Y;
  
  if(hoveringVideoButton) {
    fill(200, 0, 0);
    currentCursorShape = CursorShape.HAND;
  }
  else {
    fill(150, 0, 0);
  }
  noStroke();
  rect(X - buttonWidth, Y - buttonHeight, buttonWidth, buttonHeight, 5);
  
  textAlign(CENTER, CENTER);
  textSize(16);
  fill(255);
  text("Watch", X - buttonWidth / 2 - 15, Y - buttonHeight / 2 - 2);
  
  image(linkIcon, X - buttonWidth / 2 + 15, Y - buttonHeight / 2 - 10);
  
  if(singlePress && hoveringVideoButton) {
    link(VideoLink);
  }
}

void ModeSelection(int X) {
  int Width = 150;
  int Height = 40;
  fill(67, 67, 61);
  stroke(140, 140, 115);
  strokeWeight(1);
  rect(X - Width, -10, Width, Height + 10, 10);
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("OLL", X + Width * -0.75, Height / 2 - 2);
  text("PLL", X + Width * -0.25, Height / 2 - 2);
  
  boolean hoveringOLLButton = mouseX > X - Width && mouseX < X - Width * 0.5 && mouseY < Height;
  boolean hoveringPLLButton = mouseX > X - Width * 0.5 && mouseX < X && mouseY < Height;
  
  if ((hoveringOLLButton && !practiceType.equals("oll"))
      || (hoveringPLLButton && !practiceType.equals("pll"))) {
    currentCursorShape = CursorShape.HAND;
   }
  
  if(singlePress) {
    if(hoveringOLLButton && !practiceType.equals("oll")) {
      practiceType = "oll";
      algorithmScrollPosition = 0;
      writeSaveFile();
    }
    else if(hoveringPLLButton && !practiceType.equals("pll")) {
      practiceType = "pll";
      algorithmScrollPosition = 0;
      writeSaveFile();
    }
  }
  
  noStroke();
  if(practiceType.equals("oll")) {
    fill(255, 50);
  }
  else {
    if(hoveringOLLButton) {
      fill(255, 75);
    }
    else {
      noFill();
    }
  }
  rect(X - Width + 5, 5, Width / 2 - 10, Height - 10, 6);
  
  if(practiceType.equals("pll")) {
    fill(255, 50);
  }
  else {
    if(hoveringPLLButton) {
      fill(255, 75);
    }
    else {
      noFill();
    }
  }
  rect(X - Width / 2 + 5, 5, Width / 2 - 10, Height - 10, 6);
}

void mouseWheel(MouseEvent event) {
  scrollAmount += event.getCount();
}

void mousePressed() {
  singlePress = true;
}

void keyPressed() {
  if(editingTabName) {
    if(keyCode == BACKSPACE) {
      if(newTabName.length() > 0) {
        newTabName = newTabName.substring(0, newTabName.length() - 1);
      }
    }
    else if(keyCode == ENTER) {
      editingTabName = false;
      newTabName = trim(newTabName);
      if(practiceType.equals("oll")) {
        if(!ollTabs[tabNameBeingEdited].name.equals(newTabName)) {
          ollTabs[tabNameBeingEdited].name = newTabName;
          writeSaveFile();
        }
      }
      else {
        if(!pllTabs[tabNameBeingEdited].name.equals(newTabName)) {
          pllTabs[tabNameBeingEdited].name = newTabName;
          writeSaveFile();
        }
      }
      
    }
    else if(IsTypable(key)) {
      newTabName += key;
    }
  }
  else {
    if(key == ' ') {
      if(practiceType.equals("oll")) {
        int newOLLAlgorithm = GetRandomSelectedOLLAlgorithmIndex();
        if(newOLLAlgorithm != -1) {
          currentOLLAlgorithm = newOLLAlgorithm;
        }
      }
      else {
        int newPLLAlgorithm = GetRandomSelectedPLLAlgorithmIndex();
        if(newPLLAlgorithm != -1) {
          currentPLLAlgorithm = newPLLAlgorithm;
          edgeColorOffset = floor(random(4));
        }
      }
    }
  }
}

boolean IsTypable(char Key) {
  return (int(Key) >= int('a') && int(Key) <= int('z')) || (int(Key) >= int('A') && int(Key) <= int('Z')) || (int(Key) >= int('0') && int(Key) <= int('9')) || Key == ' ';
}
