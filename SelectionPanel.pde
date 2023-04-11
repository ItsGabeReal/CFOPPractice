// When you scroll it will either add or subtract from this number, the panel then updates the scroll position accordingly
// This isn't possible to do in the mouse wheel event itself because it can't access the item limit)
int scrollAmount = 0;
int algorithmScrollPosition = 0;
boolean holdingScrollBar = false; // True when you press it and then false whenever you release your mouse
int scrollBarHoldOffset = 0; // The difference in Y between the top of the scroll bar and where you first grabbed the scroll bar
int currentOLLTab = 0;
int currentPLLTab = 0;
boolean editingTabName = false;
String newTabName = ""; // Displayed while you're changing the tab's name
int tabNameBeingEdited = 0; // Make sure name changes are being applied to the right tab (get rekt bug)
String practiceTypeForEditedTabName; // Make sure name changes are applied to the right practice type (you bugs never stood a chance)

void SelectionPanel(int X, int Y, int Width, int Height) {
  int itemHeight = 36;
  int panelStrokeWeight = 4; // Is also used for tabs and is needed to be able to cover up stroke between current tab and panel
  int titleSpace = 60; // Padding between the top of the list and the top of the panel where text should go
  int itemLimit = floor((Height - titleSpace) / itemHeight);
  int totalEntries;
  if(practiceType.equals("oll")) { totalEntries = ollAlgorithms.length + ollAlgorithmGroups.length; }
  else { totalEntries = pllAlgorithms.length + pllAlgorithmGroups.length; }
  
  boolean hoveringAlgorithmPanel = mouseX > X && mouseX < X + Width && mouseY > Y && mouseY < Y + Height;
  
  if(scrollAmount != 0) {
    if(hoveringAlgorithmPanel) {
      if(totalEntries > itemLimit) {
        algorithmScrollPosition += scrollAmount * 2;
        
        if(algorithmScrollPosition < 0) {
          algorithmScrollPosition = 0;
        }
        else if(algorithmScrollPosition > totalEntries - itemLimit) {
          algorithmScrollPosition = totalEntries - itemLimit;
        }
      }
    }
    
    scrollAmount = 0;
  }
  
  // Tabs
  SelectionTab[] currentTabGroup = practiceType.equals("oll") ? ollTabs : pllTabs;
  int currentTabIndex = practiceType.equals("oll") ? currentOLLTab : currentPLLTab;
  int tabPadding = 5; // The horizantal padding between tabs
  int tabWidth = Width / currentTabGroup.length - tabPadding * 2;
  int tabHeight = 30;
  for(int i = 0; i < currentTabGroup.length; i++) {
    int tabX = X + tabPadding + (Width / currentTabGroup.length * i);
    int tabY = Y + Height;
    
    boolean hoveringTab = mouseX > tabX && mouseX < tabX + tabWidth && mouseY > tabY && mouseY < tabY + tabHeight;
    
    // Show hand cursor if hovering an unselected tab
    if (hoveringTab && i != currentTabIndex) { currentCursorShape = CursorShape.HAND; }
    
    if(singlePress && hoveringTab && i != currentTabIndex) {
      if(practiceType.equals("oll")) {
        currentOLLTab = i;
        DoubleCheckOLLAlgorithmGroupSelction();
      }
      else {
        currentPLLTab = i;
        DoubleCheckPLLAlgorithmGroupSelction();
      }
      writeSaveFile();
    }
    
    if(hoveringTab && i != currentTabIndex) {
      fill(currentTabGroup[i].tabColor);
    }
    else {
      fill(currentTabGroup[i].darkTabColor);
    }
    
    // Tab Box
    strokeWeight(panelStrokeWeight);
    stroke(currentTabGroup[i].tabColor);
    rect(tabX, tabY - 10, tabWidth, tabHeight + 10, 5);
    
    // Tab Name
    textAlign(CENTER, CENTER);
    textSize(12);
    fill(255);
    text(currentTabGroup[i].name, tabX + tabWidth / 2, tabY + tabHeight / 2);
  }
  
  // Panel Box
  fill(currentTabGroup[currentTabIndex].darkTabColor);
  strokeWeight(panelStrokeWeight);
  stroke(currentTabGroup[currentTabIndex].tabColor);
  rect(X, Y, Width, Height, 5);
  
  // Cover up the stroke between the panel and the selected tab
  int coverUpRectHeight = 10;
  strokeWeight(2);
  stroke(currentTabGroup[currentTabIndex].darkTabColor);
  fill(currentTabGroup[currentTabIndex].darkTabColor);
  rect(X + tabPadding + (Width / currentTabGroup.length * currentTabIndex) + panelStrokeWeight / 2 + 1, Y + Height - coverUpRectHeight / 2, tabWidth - panelStrokeWeight - 2, coverUpRectHeight - 3);
  
  // Tab Name
  boolean hoveringTabName = mouseX > X && mouseX < X + Width && mouseY > Y && mouseY < Y + titleSpace;
  if (hoveringTabName) { currentCursorShape = CursorShape.TEXT; }
  
  if(editingTabName) {
    fill(0, 50);
    rect(X + 5, Y + 5, Width - 10, titleSpace - 10, 5);
    if(singlePress && !hoveringTabName) {
      editingTabName = false;
      newTabName = trim(newTabName);
      SelectionTab[] tabGroupToApplyNameChange = practiceTypeForEditedTabName.equals("oll") ? ollTabs : pllTabs;
      // Make sure the name was actually changed
      if(!tabGroupToApplyNameChange[tabNameBeingEdited].name.equals(newTabName)) {
        tabGroupToApplyNameChange[tabNameBeingEdited].name = newTabName;
        writeSaveFile();
      }
    }
  }
  else if(hoveringTabName) {
    fill(255, 50);
    rect(X + 5, Y + 5, Width - 10, titleSpace - 10, 5);
    if(singlePress) {
      editingTabName = true;
      tabNameBeingEdited = currentTabIndex;
      practiceTypeForEditedTabName = practiceType;
      newTabName = currentTabGroup[currentTabIndex].name;
    }
  }
  textSize(24);
  fill(255);
  textAlign(CENTER, CENTER);
  if(editingTabName) {
    text(newTabName, X + Width / 2, Y + titleSpace / 2);
  }
  else {
    text(currentTabGroup[currentTabIndex].name, X + Width / 2, Y + titleSpace / 2);
  }
  
  // Update scroll bar if window was resized
  if(windowResized) {
    if(totalEntries <= itemLimit) {
      algorithmScrollPosition = 0;
    }
    else if(algorithmScrollPosition > totalEntries - itemLimit) {
      algorithmScrollPosition = totalEntries - itemLimit;
    }
  }
  
  // Display / Interact with scroll bar
  if(totalEntries > itemLimit) {
    int scrollBarPadding = 10; // The padding between the top of the panel and the top of the scroll bar
    int scrollBarHeightRange = Height - scrollBarPadding * 2 - titleSpace; // The distance from the highest and lowest point the scroll bar can reach
    int scrollBarX = X + Width - 16;
    int scrollBarY = Y + scrollBarPadding + titleSpace + round(map(algorithmScrollPosition, 0, totalEntries, 0, scrollBarHeightRange));
    int scrollBarWidth = 10;
    int scrollBarHeight = round((float)itemLimit / (float)totalEntries * (float)scrollBarHeightRange);
    if(scrollBarHeight > scrollBarHeightRange) { scrollBarHeight = scrollBarHeightRange; }
    
    int extendHitboxAmount = 6; // Extend the hitbox to make scroll bar easier to grab
    boolean hoveringScrollBar = mouseX > scrollBarX - extendHitboxAmount && mouseX < scrollBarX + scrollBarWidth + extendHitboxAmount && mouseY > scrollBarY - extendHitboxAmount && mouseY < scrollBarY + scrollBarHeight + extendHitboxAmount;
    
    if(holdingScrollBar) {
      if(!mousePressed) {
        holdingScrollBar = false;
      }
      else {
        int newScrollBarY = mouseY - scrollBarHoldOffset; // Calculate new scroll bar position
        
        // Clamp scroll bar position
        if(newScrollBarY < Y + scrollBarPadding + titleSpace) {
          newScrollBarY = Y + scrollBarPadding + titleSpace;
        }
        else if(newScrollBarY > Y + scrollBarPadding + titleSpace + scrollBarHeightRange - scrollBarHeight) {
          newScrollBarY = Y + scrollBarPadding + titleSpace + scrollBarHeightRange - scrollBarHeight;
        }
        
        algorithmScrollPosition = round(map(newScrollBarY, Y + scrollBarPadding + titleSpace, Y + scrollBarPadding + titleSpace + scrollBarHeightRange - scrollBarHeight, 0, totalEntries - itemLimit)); // Calculate new value for algorithmScrollPosition
        
        scrollBarY = newScrollBarY; // Update scroll bar position
      }
    }
    else {
      if(hoveringScrollBar && mousePressed) {
        holdingScrollBar = true;
        scrollBarHoldOffset = mouseY - scrollBarY;
      }
    }
    
    noStroke();
    if(holdingScrollBar) {
      fill(200, 255);
    }
    else if(hoveringScrollBar) {
      fill(200, 150);
    }
    else {
      fill(100, 150);
    }
    rect(scrollBarX, scrollBarY, scrollBarWidth, scrollBarHeight, 3);
  }
  
  // Display Entries
  int currentDisplayIndex = 0; // Keeps track of how many items we've displayed to tell when we've reached the limit
  for(int group = 0; group < (practiceType.equals("oll") ? ollAlgorithmGroups.length : pllAlgorithmGroups.length); group++) {
    if(currentDisplayIndex >= algorithmScrollPosition) {
      if(practiceType.equals("oll")) {
        DisplayOLLGroupSelector(X + 30, Y + titleSpace + itemHeight * (currentDisplayIndex - algorithmScrollPosition) + itemHeight / 2, ollAlgorithmGroups[group]);
      }
      else {
        DisplayPLLGroupSelector(X + 30, Y + titleSpace + itemHeight * (currentDisplayIndex - algorithmScrollPosition) + itemHeight / 2, pllAlgorithmGroups[group]);
      }
    }
    currentDisplayIndex++;
    if(currentDisplayIndex - algorithmScrollPosition + 1 > itemLimit) { return; } // Terminate if we've displayed the maximum number of items
    
    for(int alg = 0; alg < (practiceType.equals("oll") ? ollAlgorithmGroups[group].algorithms.length : pllAlgorithmGroups[group].algorithms.length); alg++) {
      if(currentDisplayIndex >= algorithmScrollPosition) {
        if(practiceType.equals("oll")) {
          DisplayOLLAlgorithmSelector(X + 40, Y + titleSpace + itemHeight * (currentDisplayIndex - algorithmScrollPosition) + itemHeight / 2, itemHeight, ollAlgorithmGroups[group].algorithms[alg]);
        }
        else {
          DisplayPLLAlgorithmSelector(X + 40, Y + titleSpace + itemHeight * (currentDisplayIndex - algorithmScrollPosition) + itemHeight / 2, itemHeight, pllAlgorithmGroups[group].algorithms[alg]);
        }
      }
      currentDisplayIndex++;
      if(currentDisplayIndex - algorithmScrollPosition + 1 > itemLimit) { return; } // Terminate if we've displayed the maximum number of items
    }
  }
}

class SelectionTab {
  String name;
  int hue;
  color tabColor;
  color darkTabColor;
  boolean[] selections; // This kind of work along side of each algorithm. Each entry corresponds to the index of the algorithm
  
  SelectionTab(int Hue) {
    this.hue = Hue;
  }
  
  void Init(String Name, int NumberOfSelections) {
    // Set the colors
    colorMode(HSB, 360, 100, 100);
    this.tabColor = color(this.hue, 65, 75);
    this.darkTabColor = color(this.hue, 50, 30);
    colorMode(RGB, 255);
    
    this.name = Name;
    this.selections = new boolean[NumberOfSelections];
    for(int i = 0; i < NumberOfSelections; i++) {
      this.selections[i] = false;
    }
  }
}

SelectionTab[] ollTabs = {
  new SelectionTab(0),
  new SelectionTab(120),
  new SelectionTab(240)
};

SelectionTab[] pllTabs = {
  new SelectionTab(0),
  new SelectionTab(120),
  new SelectionTab(240)
};
