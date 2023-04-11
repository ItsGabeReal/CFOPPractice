int edgeColorOffset = 0; // To spice things up this shifts the edge colors randomly every time the alg gets re-rolled

class ArrowLocation {
  char arrowType; // 'm' = Move in one direction | 's' = Swap locations
  PVector arrowStartMultiplier; // The start location multiplier (I'm using a multiplier instead of a location so that the piece size can vary)
  PVector arrowStopMultiplier; // The stop location multiplier
  float arrowRotation;
  
  ArrowLocation(char ArrowType, int StartIndex, int StopIndex) {
    arrowType = ArrowType;
    
    // Get start and stop multipliers
    this.arrowStartMultiplier = this.GetPieceOffsetMultiplier(StartIndex);
    this.arrowStopMultiplier = this.GetPieceOffsetMultiplier(StopIndex);
    
    // Get arrow tip rotation
    this.arrowRotation = -atan2(this.arrowStartMultiplier.x - this.arrowStopMultiplier.x, this.arrowStartMultiplier.y - this.arrowStopMultiplier.y);
    
    // Shrink arrow size
    float shrinkAmount = 0.25;
    this.arrowStartMultiplier.x += sin(-this.arrowRotation + PI) * shrinkAmount;
    this.arrowStartMultiplier.y += cos(-this.arrowRotation + PI) * shrinkAmount;
    this.arrowStopMultiplier.x += sin(-this.arrowRotation) * shrinkAmount;
    this.arrowStopMultiplier.y += cos(-this.arrowRotation) * shrinkAmount;
  }
  
  void ShowArrow(float X, float Y, int PieceSize, boolean IconSized) {
    strokeWeight(IconSized ? 1 : 5);
    stroke(0);
    line(X + PieceSize * this.arrowStartMultiplier.x, Y + PieceSize * this.arrowStartMultiplier.y, X + PieceSize * this.arrowStopMultiplier.x, Y + PieceSize * this.arrowStopMultiplier.y);
    
    //if(IconSized) { return; }
    this.DrawArrowTip(X + PieceSize * this.arrowStopMultiplier.x, Y + PieceSize * this.arrowStopMultiplier.y, this.arrowRotation, IconSized);
    if(this.arrowType == 's') {
      this.DrawArrowTip(X + PieceSize * this.arrowStartMultiplier.x, Y + PieceSize * this.arrowStartMultiplier.y, this.arrowRotation + PI, IconSized);
    }
  }
  
  PVector GetPieceOffsetMultiplier(int PieceIndex) {
    switch(PieceIndex) {
      case 0: return new PVector(-1, -1);
      case 1: return new PVector(0, -1);
      case 2: return new PVector(1, -1);
      case 3: return new PVector(-1, 0);
      case 4: return new PVector(0, 0);
      case 5: return new PVector(1, 0);
      case 6: return new PVector(-1, 1);
      case 7: return new PVector(0, 1);
      case 8: return new PVector(1, 1);
      default: return new PVector(0, 0);
    }
  }
  
  void DrawArrowTip(float X, float Y, float Rotation, boolean IconSized) {
    float triangleSize = IconSized ? 1.25 : 5;
    fill(0);
    noStroke();
    pushMatrix();
      translate(X, Y);
      rotate(Rotation);
      triangle(0, -triangleSize * 2, -triangleSize * 1.732, triangleSize, triangleSize * 1.732, triangleSize);
    popMatrix();
  }
}

class PLLAlgorithm {
  int[] faceIndexes = new int[12]; // 12 in total. 3 for each face. 1 is up, 2 is right, 3 is bottom, 4 is left
  ArrowLocation[] arrowLocations;
  String algorithm;
  String videoLink;
  int index; // Used to determine which selection is theirs
  
  PLLAlgorithm(String FaceIndexes, String ArrowLocations, String Algorithm, String VideoLink) {
    // Parse face indexes
    for(int i = 0; i < faceIndexes.length; i++) {
      faceIndexes[i] = int(FaceIndexes.charAt(i)) - 49;
    }
    
    // Parse arrow locations
    String[] splitArrowLocations = ArrowLocations.split(" ");
    arrowLocations = new ArrowLocation[splitArrowLocations.length];
    for(int i = 0; i < arrowLocations.length; i++) {
      arrowLocations[i] = new ArrowLocation(splitArrowLocations[i].charAt(0), int(splitArrowLocations[i].charAt(1)) - 48, int(splitArrowLocations[i].charAt(2)) - 48);
    }
    
    algorithm = Algorithm;
    videoLink = VideoLink;
  }
  
  void display(float displayX, float displayY, boolean iconSized) {
    int pieceSize = iconSized ? 8 : 70;
    int edgeColorThickness = iconSized ? 3 : 10; // The thickness of the orientation indicator box
    
    // Display Pieces
    strokeWeight(1);
    stroke(50);
    fill(pieceYellow);
    for(int row = 0; row < 3; row++) {
      for(int column = 0; column < 3; column++) {
        rect((displayX - pieceSize * 1.5) + pieceSize * row, (displayY - pieceSize * 1.5) + pieceSize * column, pieceSize, pieceSize);
      }
    }
    
    // Display Arrows
    for(int i = 0; i < this.arrowLocations.length; i++) {
      arrowLocations[i].ShowArrow(displayX, displayY, pieceSize, iconSized);
    }
    
    // Display Edge Colors
    strokeWeight(1);
    stroke(0);
    int colorOffset = iconSized ? 0 : edgeColorOffset;
    // TOP
    fill(this.IndexColor(faceIndexes[0] + colorOffset));
    rect(displayX + pieceSize * -1.5, displayY + pieceSize * -1.5 - edgeColorThickness, pieceSize, edgeColorThickness);
    fill(this.IndexColor(faceIndexes[1] + colorOffset));
    rect(displayX + pieceSize * -0.5, displayY + pieceSize * -1.5 - edgeColorThickness, pieceSize, edgeColorThickness);
    fill(this.IndexColor(faceIndexes[2] + colorOffset));
    rect(displayX + pieceSize * 0.5, displayY + pieceSize * -1.5 - edgeColorThickness, pieceSize, edgeColorThickness);
    // RIGHT
    fill(this.IndexColor(faceIndexes[3] + colorOffset));
    rect(displayX + pieceSize * 1.5, displayY + pieceSize * -1.5, edgeColorThickness, pieceSize);
    fill(this.IndexColor(faceIndexes[4] + colorOffset));
    rect(displayX + pieceSize * 1.5, displayY + pieceSize * -0.5, edgeColorThickness, pieceSize);
    fill(this.IndexColor(faceIndexes[5] + colorOffset));
    rect(displayX + pieceSize * 1.5, displayY + pieceSize * 0.5, edgeColorThickness, pieceSize);
    // BOTTOM
    fill(this.IndexColor(faceIndexes[6] + colorOffset));
    rect(displayX + pieceSize * 0.5, displayY + pieceSize * 1.5, pieceSize, edgeColorThickness);
    fill(this.IndexColor(faceIndexes[7] + colorOffset));
    rect(displayX + pieceSize * -0.5, displayY + pieceSize * 1.5, pieceSize, edgeColorThickness);
    fill(this.IndexColor(faceIndexes[8] + colorOffset));
    rect(displayX + pieceSize * -1.5, displayY + pieceSize * 1.5, pieceSize, edgeColorThickness);
    // LEFT
    fill(this.IndexColor(faceIndexes[9] + colorOffset));
    rect(displayX + pieceSize * -1.5 - edgeColorThickness, displayY + pieceSize * 0.5, edgeColorThickness, pieceSize);
    fill(this.IndexColor(faceIndexes[10] + colorOffset));
    rect(displayX + pieceSize * -1.5 - edgeColorThickness, displayY + pieceSize * -0.5, edgeColorThickness, pieceSize);
    fill(this.IndexColor(faceIndexes[11] + colorOffset));
    rect(displayX + pieceSize * -1.5 - edgeColorThickness, displayY + pieceSize * -1.5, edgeColorThickness, pieceSize);
  }
  
  // Converts face indexes into colors (BREAKS IF INDEX IS NEGATIVE... i think)
  color IndexColor(int Index) {
    int clampedIndex = Index % 4;
    switch(clampedIndex) {
      case 0: return pieceBlue;
      case 1: return pieceOrange;
      case 2: return pieceGreen;
      case 3: return pieceRed;
      default: return color(0);
    }
  }
}

class PLLAlgorithmGroup {
  String name;
  PLLAlgorithm[] algorithms;
  boolean anySelected = true;
  boolean allSelected = true;
  
  PLLAlgorithmGroup(String Name, PLLAlgorithm[] Algorithms) {
    name = Name;
    algorithms = Algorithms;
  }
  
  // Update group selection based on what children are selected
  void CheckSelection() {
    boolean anyUnselected = false;
    this.anySelected = false;
    for(int i = 0; i < this.algorithms.length; i++) {
      if(pllTabs[currentPLLTab].selections[this.algorithms[i].index] == true) {
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
      pllTabs[currentPLLTab].selections[this.algorithms[i].index] = newState;
    }
    
    // Update group state
    this.CheckSelection();
  }
}

void DisplayPLLGroupSelector(int X, int Y, PLLAlgorithmGroup AlgorithmGroup) {
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

void DisplayPLLAlgorithmSelector(int X, int Y, int Height, PLLAlgorithm Algorithm) {
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
      pllTabs[currentPLLTab].selections[Algorithm.index] = !pllTabs[currentPLLTab].selections[Algorithm.index];
      
      // Double check all the oll algorithm groups in case they need to change their checkbox needs to change
      for(int i = 0; i < pllAlgorithmGroups.length; i++) {
        pllAlgorithmGroups[i].CheckSelection();
      }
      writeSaveFile();
    }
    else if(hoveringEntry) {
      currentPLLAlgorithm = Algorithm.index;
      writeSaveFile();
    }
    
  }
  
  if(pllTabs[currentPLLTab].selections[Algorithm.index]) {
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
void DoubleCheckPLLAlgorithmGroupSelction() {
  for(int i = 0; i < pllAlgorithmGroups.length; i++) {
    pllAlgorithmGroups[i].CheckSelection();
  }
}

int GetNumberOfPLLAlgorithms() {
  int total = 0;
  for(int i = 0; i < pllAlgorithmGroups.length; i++) {
    total += pllAlgorithmGroups[i].algorithms.length;
  }
  return total;
}

PLLAlgorithm[] GetAllPLLAlgorithms() {
  PLLAlgorithm[] output = new PLLAlgorithm[GetNumberOfPLLAlgorithms()];
  
  int currentIndex = 0;
  for(int i = 0; i < pllAlgorithmGroups.length; i++) {
    for(int j = 0; j < pllAlgorithmGroups[i].algorithms.length; j++) {
      output[currentIndex] = pllAlgorithmGroups[i].algorithms[j];
      currentIndex++;
    }
  }
  return output;
}

int GetRandomSelectedPLLAlgorithmIndex() {
  ArrayList<Integer> selectedAlgorithms = new ArrayList<Integer>();
  
  for(int i = 0; i < pllAlgorithms.length; i++) {
    if(pllTabs[currentPLLTab].selections[pllAlgorithms[i].index] && pllAlgorithms[i] != pllAlgorithms[currentPLLAlgorithm]) {
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
