class OLLAlgorithm {
  String orientation;
  String algorithm;
  String videoLink;
  int index; // Used to determine which selection is theirs
  
  OLLAlgorithm(String Orientation, String Algorithm, String VideoLink) {
    orientation = Orientation;
    algorithm = Algorithm;
    videoLink = VideoLink;
  }
  
  void display(float displayX, float displayY, boolean iconSized) {
    int pieceSize = iconSized ? 8 : 70;
    int orientationIndicatorThickness = iconSized ? 2 : 8; // The thickness of the orientation indicator box
    int orientationIndicatorLength = iconSized ? pieceSize : pieceSize - 6; // How long the orientation indicator is from side to side
    int orientationIndicatorFloatAmnt = iconSized ? 1 : 5; // The distance the orientation indicator hovers away from the cube
    
    for(int i = 0; i < 9; i++) {
      PVector pieceOffset = new PVector(0, 0);
      switch(i) {
        case 0: pieceOffset = new PVector(-pieceSize - pieceSize/2, -pieceSize - pieceSize/2); break; // top left
        case 1: pieceOffset = new PVector(-pieceSize/2, -pieceSize - pieceSize/2); break; // top center
        case 2: pieceOffset = new PVector(pieceSize/2, -pieceSize - pieceSize/2); break;// top right
        case 3: pieceOffset = new PVector(pieceSize/2, -pieceSize/2); break; // center right
        case 4: pieceOffset = new PVector(-pieceSize/2, -pieceSize/2); break; // center center
        case 5: pieceOffset = new PVector(pieceSize/2, pieceSize/2); break; // bottom right
        case 6: pieceOffset = new PVector(-pieceSize/2, pieceSize/2); break; // bottom center
        case 7: pieceOffset = new PVector(-pieceSize - pieceSize/2, pieceSize/2); break; // bottom left
        case 8: pieceOffset = new PVector(-pieceSize - pieceSize/2, -pieceSize/2); break; // center left
      }
      pieceOffset.x += displayX;
      pieceOffset.y += displayY;
      
      if(i == 4) {
        fill(pieceYellow);
        strokeWeight(1);
        rect(pieceOffset.x, pieceOffset.y, pieceSize, pieceSize);
      }
      else {
        int charIndex = i < 4 ? i : i - 1; // The orientation string (eg "lcccrcdc") ignores the center piece (or index 4) so make sure we compensate for that
        
        // Draw Pieces
        strokeWeight(1);
        stroke(0);
        switch(this.orientation.charAt(charIndex)) {
          case 'c':
            fill(pieceYellow);
            rect(pieceOffset.x, pieceOffset.y, pieceSize, pieceSize);
            break;
          case 'u':
            fill(pieceWhite);
            rect(pieceOffset.x, pieceOffset.y, pieceSize, pieceSize);
            break;
          case 'r':
            fill(pieceWhite);
            rect(pieceOffset.x, pieceOffset.y, pieceSize, pieceSize);
            break;
          case 'd':
            fill(pieceWhite);
            rect(pieceOffset.x, pieceOffset.y, pieceSize, pieceSize);
            break;
          case 'l':
            fill(pieceWhite);
            rect(pieceOffset.x, pieceOffset.y, pieceSize, pieceSize);
            break;
        }
        
        // Draw Edge Indicators
        strokeWeight(iconSized ? 0 : 1);
        fill(pieceYellow);
        switch(this.orientation.charAt(charIndex)) {
          case 'u':
            rect(pieceOffset.x + (pieceSize - orientationIndicatorLength) / 2, pieceOffset.y - orientationIndicatorThickness - orientationIndicatorFloatAmnt, orientationIndicatorLength, orientationIndicatorThickness, 1);
            break;
          case 'r':
            rect(pieceOffset.x + pieceSize + orientationIndicatorFloatAmnt, pieceOffset.y + (pieceSize - orientationIndicatorLength) / 2, orientationIndicatorThickness, orientationIndicatorLength, 1);
            break;
          case 'd':
            rect(pieceOffset.x + (pieceSize - orientationIndicatorLength) / 2, pieceOffset.y + pieceSize + orientationIndicatorFloatAmnt, orientationIndicatorLength, orientationIndicatorThickness, 1);
            break;
          case 'l':
            rect(pieceOffset.x + - orientationIndicatorFloatAmnt - orientationIndicatorThickness, pieceOffset.y + (pieceSize - orientationIndicatorLength) / 2, orientationIndicatorThickness, orientationIndicatorLength, 1);
            break;
        }
      }
    }
  }
}

class OLLAlgorithmGroup {
  String name;
  OLLAlgorithm[] algorithms;
  boolean anySelected = true;
  boolean allSelected = true;
  
  OLLAlgorithmGroup(String Name, OLLAlgorithm[] Algorithms) {
    name = Name;
    algorithms = Algorithms;
  }
  
  // Update group selection based on what children are selected
  void CheckSelection() {
    boolean anyUnselected = false;
    this.anySelected = false;
    for(int i = 0; i < this.algorithms.length; i++) {
      if(ollTabs[currentOLLTab].selections[this.algorithms[i].index] == true) {
        this.anySelected = true;
      }
      else {
        anyUnselected = true;
      }
    }
    
    this.allSelected = !anyUnselected;
  }
  
  void FlipSelection() {
    boolean newState = !this.anySelected;
    
    // Update all children's states
    for(int i = 0; i < this.algorithms.length; i++) {
      ollTabs[currentOLLTab].selections[this.algorithms[i].index] = newState;
    }
    
    // Update group state
    this.CheckSelection();
  }
}

void DisplayOLLGroupSelector(int X, int Y, OLLAlgorithmGroup AlgorithmGroup) {
  int buttonSize = 14;
  
  int extendHitboxAmount = 10; // Extend the checkbox hitbox because the button isn't particularly big
  boolean hoveringCheckbox = mouseX > X - extendHitboxAmount && mouseX < X + buttonSize + extendHitboxAmount && mouseY > Y - buttonSize / 2 - extendHitboxAmount && mouseY < Y + buttonSize / 2 + extendHitboxAmount;
  
  if (hoveringCheckbox) { currentCursorShape = CursorShape.HAND; }
  
  if(singlePress && hoveringCheckbox) {
    AlgorithmGroup.FlipSelection();
    writeSaveFile();
  }
  
  if(AlgorithmGroup.anySelected) {
    if(hoveringCheckbox) {
      stroke(checkboxHovered);
      fill(checkboxHovered);
    }
    else {
      stroke(checkboxRegular);
      fill(checkboxRegular);
    }
    strokeWeight(2);
    rect(X, Y - buttonSize / 2, buttonSize, buttonSize, 2);
    
    // Checkmark
    if(AlgorithmGroup.allSelected) {
      strokeWeight(2);
      stroke(255);
      line(X + buttonSize / 2 - 3, Y + 1, X + buttonSize / 2 - 1, Y + 3);
      line(X + buttonSize / 2 - 1, Y + 3, X + buttonSize / 2 + 3, Y - 3);
    }
  }
  else {
    if(hoveringCheckbox) {
      stroke(checkboxHovered);
    }
    else {
      stroke(checkboxRegular);
    }
    strokeWeight(2);
    noFill();
    rect(X, Y - buttonSize / 2, buttonSize, buttonSize, 2);
  }
  
  textAlign(LEFT, CENTER);
  textSize(14);
  fill(255);
  text(AlgorithmGroup.name, X + buttonSize + 5, Y - 2);
}

void DisplayOLLAlgorithmSelector(int X, int Y, int Height, OLLAlgorithm Algorithm) {
  int buttonSize = 10;
  int checkboxXOffset = 10;
  int Width = 70;
  
  int extendHitboxAmount = 13; // Extend the checkbox hitbox because the button is tiny
  boolean hoveringCheckbox = mouseX > X - extendHitboxAmount + checkboxXOffset && mouseX < X + buttonSize + extendHitboxAmount + checkboxXOffset && mouseY > Y - buttonSize / 2 - extendHitboxAmount && mouseY < Y + buttonSize / 2 + extendHitboxAmount;
  
  int hitboxExtendLeft = 50;
  int hitboxExtendRight = 150;
  boolean hoveringEntry = mouseX > X - hitboxExtendLeft && mouseX < X + Width + hitboxExtendRight && mouseY > Y - Height / 2 && mouseY < Y + Height / 2;
  
  if (hoveringEntry) { currentCursorShape = CursorShape.HAND; }
  
  if(hoveringEntry && !hoveringCheckbox) {
    fill(255, 100);
  }
  else {
    noFill();
  }
  noStroke();
  rect(X, Y - Height / 2, Width, Height, 2);
  
  if(singlePress) {
    if(hoveringCheckbox) {
      ollTabs[currentOLLTab].selections[Algorithm.index] = !ollTabs[currentOLLTab].selections[Algorithm.index];
      
      // Double check all the oll algorithm groups in case they need to change their checkbox needs to change
      for(int i = 0; i < ollAlgorithmGroups.length; i++) {
        ollAlgorithmGroups[i].CheckSelection();
      }
      writeSaveFile();
    }
    else if(hoveringEntry) {
      currentOLLAlgorithm = Algorithm.index;
      writeSaveFile();
    }
    
  }
  
  if(ollTabs[currentOLLTab].selections[Algorithm.index]) {
    if(hoveringCheckbox) {
      stroke(checkboxHovered);
      fill(checkboxHovered);
    }
    else {
      stroke(checkboxRegular);
      fill(checkboxRegular);
    }
    strokeWeight(2);
    rect(X + checkboxXOffset, Y - buttonSize / 2, buttonSize, buttonSize, 2);
    
    // Checkmark
    strokeWeight(2);
    stroke(255);
    line(X + checkboxXOffset + buttonSize / 2 - 3, Y + 1, X + checkboxXOffset + buttonSize / 2 - 1, Y + 3);
    line(X + checkboxXOffset + buttonSize / 2 - 1, Y + 3, X + checkboxXOffset + buttonSize / 2 + 3, Y - 3);
  }
  else {
    if(hoveringCheckbox) {
      stroke(checkboxHovered);
    }
    else {
      stroke(checkboxRegular);
    }
    strokeWeight(2);
    noFill();
    rect(X + checkboxXOffset, Y - buttonSize / 2, buttonSize, buttonSize, 2);
  }
  
  Algorithm.display(X + 46, Y, true);
}

// Every time an algorithm is selected or deselected, we need to check if it's group's checkbox should change
void UpdateOLLGroupCheckmarks() {
  for(int i = 0; i < ollAlgorithmGroups.length; i++) {
    ollAlgorithmGroups[i].CheckSelection();
  }
}

int GetNumberOfOLLAlgorithms() {
  int total = 0;
  for(int i = 0; i < ollAlgorithmGroups.length; i++) {
    total += ollAlgorithmGroups[i].algorithms.length;
  }
  return total;
}

OLLAlgorithm[] GetAllOLLAlgorithms() {
  OLLAlgorithm[] output = new OLLAlgorithm[GetNumberOfOLLAlgorithms()];
  
  int currentIndex = 0;
  for(int i = 0; i < ollAlgorithmGroups.length; i++) {
    for(int j = 0; j < ollAlgorithmGroups[i].algorithms.length; j++) {
      output[currentIndex] = ollAlgorithmGroups[i].algorithms[j];
      currentIndex++;
    }
  }
  return output;
}

int GetRandomSelectedOLLAlgorithmIndex() {
  ArrayList<Integer> selectedAlgorithms = new ArrayList<Integer>();
  
  for(int i = 0; i < ollAlgorithms.length; i++) {
    if(ollTabs[currentOLLTab].selections[ollAlgorithms[i].index] && ollAlgorithms[i] != ollAlgorithms[currentOLLAlgorithm]) {
      selectedAlgorithms.add(i);
    }
  }
  
  int randomIndex = floor(random(selectedAlgorithms.size()));
  
  if(selectedAlgorithms.size() == 0) {
    return -1;
  }
  else {
    return selectedAlgorithms.get(randomIndex);
  }
}
