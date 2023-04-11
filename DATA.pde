OLLAlgorithm[] ollAlgorithms; // Gets initialized in setup by reading the algorithms from each group
PLLAlgorithm[] pllAlgorithms;

OLLAlgorithm[] all_edges_oriented = {
  new OLLAlgorithm("lcccrcdc", "R U2 R' U' R U' R'", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=9"),
  new OLLAlgorithm("ucrcdccc", "R U R' U R U2' R'", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=20"),
  new OLLAlgorithm("ucucdcdc", "(R U2 R') (U' R U R') (U' R U' R')", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=28"),
  new OLLAlgorithm("lcucdclc", "R U2' R2' U' R2 U' R2' U2' R", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=41"),
  new OLLAlgorithm("ucccccdc", "(r U R' U') (r' F R F')", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=52"),
  new OLLAlgorithm("ccrcccdc", "y F' (r U R' U') r' F R", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=60"),
  new OLLAlgorithm("ccccdcdc", "R2 D (R' U2 R) D' (R' U2 R')", "https://youtu.be/8LVPHtzhiNU?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=69")
};

OLLAlgorithm[] t_shapes = {
  new OLLAlgorithm("uucccddc", "(R U R' U') (R' F R F')", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=12"),
  new OLLAlgorithm("lucccdlc", "F (R U R' U') F'", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=20")
};
OLLAlgorithm[] squares = {
  new OLLAlgorithm("uurcccll", "(r' U2' R U R' U r)", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=28"),
  new OLLAlgorithm("lcccrddl", "(r U2 R' U' R U' r')", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=39")
};
OLLAlgorithm[] c_shapes = {
  new OLLAlgorithm("lurccdcc", "(R U R2' U') (R' F R U) R U' F'", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=49"),
  new OLLAlgorithm("ccrrrccl", "R' U' (R' F R F') U R", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=62")
};
OLLAlgorithm[] w_shapes = {
  new OLLAlgorithm("currccdc", "(R' U' R U') (R' U R U) l U' R' U x", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=73"),
  new OLLAlgorithm("uccrrdcc", "(R U R' U) (R U' R' U') (R' F R F')", "https://youtu.be/8UtGK9ME5dg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=99")
};
OLLAlgorithm[] corners_correct = {
  new OLLAlgorithm("cccrcdcc", "(r U R' U') M (U R U' R')", "https://youtu.be/uUHyp30d_Z8?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=10"),
  new OLLAlgorithm("cucccdcc", "(R U R' U') M' (U R U' r')", "https://youtu.be/uUHyp30d_Z8?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=20")
};
OLLAlgorithm[] p_shapes = {
  new OLLAlgorithm("uccccddl", "(R' U' F) (U R U' R') F' R", "https://youtu.be/uUHyp30d_Z8?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=28"),
  new OLLAlgorithm("uuccccdl", "R U B' (U' R' U) (R B R')", "https://youtu.be/uUHyp30d_Z8?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=36"),
  new OLLAlgorithm("currrccc", "y R' U' F' U F R", "https://youtu.be/uUHyp30d_Z8?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=47"),
  new OLLAlgorithm("luccccll", "f (R U R' U') f'", "https://youtu.be/uUHyp30d_Z8?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=55")
};
OLLAlgorithm[] i_shapes = {
  new OLLAlgorithm("luucddlc", "f (R U R' U') (R U R' U') f'", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=9"),
  new OLLAlgorithm("lurcrdlc", "r' U' r (U' R' U R) (U' R' U R) r' U r", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=19"),
  new OLLAlgorithm("ucrrrcdl", "(R' U' R U' R' U) y' (R' U R) B", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=31"),
  new OLLAlgorithm("lcrrrcll", "y (R' F R U) (R U' R2' F') R2 U' R' (U R U R')", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=42")
};
OLLAlgorithm[] fish_shapes = {
  new OLLAlgorithm("lcurcddc", "(R U R' U') R' F (R2 U R' U') F'", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=54"),
  new OLLAlgorithm("uucrdclc", "(R U R' U) (R' F R F') (R U2' R')", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=66"),
  new OLLAlgorithm("curcccdl", "(R U2') (R2' F R F') (R U2' R')", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=78"),
  new OLLAlgorithm("ccrrcddc", "F (R U' R' U') (R U R' F')", "https://youtu.be/6egtt7UFoqY?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=89")
};
OLLAlgorithm[] knight_move_shapes = {
  new OLLAlgorithm("uurcddcc", "(r U' r') (U' r U r') y' (R' U R)", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=10"),
  new OLLAlgorithm("luuccddc", "(R' F R) (U R' F' R) (F U' F')", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=19"),
  new OLLAlgorithm("luccrddc", "(r U r') (R U R' U') (r U' r')", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=29"),
  new OLLAlgorithm("uurccdlc", "(r' U' r) (R' U' R U) (r' U r)", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=38")
};
OLLAlgorithm[] awkward_shapes = {
  new OLLAlgorithm("cucrrclc", "y (R U R' U') (R U' R') (F' U' F) (R U R')", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=48"),
  new OLLAlgorithm("ccucddcl", "y' F U (R U2 R' U') (R U2 R' U') F'", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=59"),
  new OLLAlgorithm("ucurcdcc", "(R U R' U R U2' R') F (R U R' U') F'", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=71"),
  new OLLAlgorithm("cucrdcdc", "(R' U' R U' R' U2 R) F (R U R' U') F'", "https://youtu.be/1ekGbasbKwI?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=84")
};
OLLAlgorithm[] l_shapes = {
  new OLLAlgorithm("lcurddlc", "F (R U R' U') (R U R' U') F'", "https://youtu.be/LLPZRUpxFdw?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=8"),
  new OLLAlgorithm("ucrcrddl", "F' (L' U' L U) (L' U' L U) F", "https://youtu.be/LLPZRUpxFdw?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=18"),
  new OLLAlgorithm("lcucddll", "r U' r2' U r2 U r2' U' r", "https://youtu.be/LLPZRUpxFdw?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=28"),
  new OLLAlgorithm("luucdcll", "r' U r2 U' r2' U' r2 U r'", "https://youtu.be/LLPZRUpxFdw?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=39"),
  new OLLAlgorithm("lurcrcll", "(r' U' R U') (R' U R U') R' U2 r", "https://youtu.be/LLPZRUpxFdw?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=50"),
  new OLLAlgorithm("lcrcrdll", "(r U R' U) (R U' R' U) R U2' r'", "https://youtu.be/LLPZRUpxFdw?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=62")
};
OLLAlgorithm[] lightning_bolts = {
  new OLLAlgorithm("ucrrddcc", "(r U R' U R U2' r')", "https://youtu.be/dSNZVRCHNzg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=9"),
  new OLLAlgorithm("cuurrcdc", "(r' U' R U' R' U2 r)", "https://youtu.be/dSNZVRCHNzg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=19"),
  new OLLAlgorithm("uurcdccl", "r' (R2 U R' U R U2 R') U M'", "https://youtu.be/dSNZVRCHNzg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=30"),
  new OLLAlgorithm("ccucrddl", "M' (R' U' R U' R' U2 R) U' M", "https://youtu.be/dSNZVRCHNzg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=43"),
  new OLLAlgorithm("uuccrdcc", "(L F') (L' U' L U) F U' L'", "https://youtu.be/dSNZVRCHNzg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=56"),
  new OLLAlgorithm("cuuccdlc", "(R' F) (R U R' U') F' U R", "https://youtu.be/dSNZVRCHNzg?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=67")
};
OLLAlgorithm[] no_edges = {
  new OLLAlgorithm("lurrrdll", "(R U2') (R2' F R F') U2' (R' F R F')", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=10"),
  new OLLAlgorithm("luurddll", "F (R U R' U') F' f (R U R' U') f'", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=23"),
  new OLLAlgorithm("uurrcdll", "f (R U R' U') f' U' F (R U R' U') F'", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=37"),
  new OLLAlgorithm("lucrrddl", "f (R U R' U') f' U F (R U R' U') F'", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=51"),
  new OLLAlgorithm("cucrdddl", "y R U2' (R2' F R F') U2' M' (U R U' r')", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=64"),
  new OLLAlgorithm("cucrrdll", "M U (R U R' U') M' (R' F R F')", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=78"),
  new OLLAlgorithm("cuurcdll", "(R U R' U) (R' F R F') U2' (R' F R F')", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=90"),
  new OLLAlgorithm("cucrcdcl", "M U (R U R' U') M2' (U R U' r')", "https://youtu.be/5H0oYHHD_dQ?list=PLdR4dU8IUTixFfXB5K4_Zd4eTzzbhzzXJ&t=103")
};

PLLAlgorithm[] edges_only = {
  new PLLAlgorithm("111232343424", "m35 m57 m73", "R2 U (R U R' U') R' U' (R' U R')", "https://youtu.be/HWIQdX8vHcE?t=53"),
  new PLLAlgorithm("111242323434", "m53 m37 m75", "(R U' R U) R U (R U' R' U') R2", "https://youtu.be/HWIQdX8vHcE?t=88"),
  new PLLAlgorithm("141232323414", "s13 s57", "(M2' U M2' U) (M' U2) (M2' U2 M') [U2]", "https://youtu.be/HWIQdX8vHcE?t=131"),
  new PLLAlgorithm("131242313424", "s17 s35", "(M2' U M2') U2 (M2' U M2')", "https://youtu.be/HWIQdX8vHcE?t=175")
};
PLLAlgorithm[] corners_only = {
  new PLLAlgorithm("212324133441", "m02 m28 m80", "x (R' U R') D2 (R U' R') D2 R2 x'", "https://youtu.be/HWIQdX8vHcE?t=197"),
  new PLLAlgorithm("314121233442", "m20 m08 m82", "x R2' D2 (R U R') D2 (R U' R) x'", "https://youtu.be/HWIQdX8vHcE?t=230"),
  new PLLAlgorithm("412321234143", "s06 s28", "x' (R U' R' D) (R U R' D') (R U R' D) (R U' R' D') x", "https://youtu.be/HWIQdX8vHcE?t=257")
};
PLLAlgorithm[] adjacent_corners = {
  new PLLAlgorithm("142321233414", "s13 s28", "(R U' R' U') (R U R D) (R' U' R D') (R' U2 R') [U']", "https://youtu.be/HWIQdX8vHcE?t=279"),
  new PLLAlgorithm("214132323441", "s02 s57", "(R' U2 R U2') R' F (R U R' U') R' F' R2 [U']", "https://youtu.be/HWIQdX8vHcE?t=334"),
  new PLLAlgorithm("244122333411", "s02 s13", "(R' U L' U2) (R U' R' U2 R) L [U']", "https://youtu.be/HWIQdX8vHcE?t=369"),
  new PLLAlgorithm("112331223444", "s28 s57", "(R U R' F') (R U R' U') R' F R2 U' R' [U']", "https://youtu.be/HWIQdX8vHcE?t=400"),
  new PLLAlgorithm("112341233424", "s28 s35", "(R U R' U') (R' F R2 U') R' U' (R U R' F')", "https://youtu.be/HWIQdX8vHcE?t=417"),
  new PLLAlgorithm("132321213444", "s17 s28", "(R' U' F')(R U R' U')(R' F R2 U')(R' U' R U)(R' U R)", "https://youtu.be/HWIQdX8vHcE?t=437")
};
PLLAlgorithm[] diagonal_corners = {
  new PLLAlgorithm("321214133442", "s08 s15", "(R' U R' U') y (R' F' R2 U') (R' U R' F) R F", "https://youtu.be/HWIQdX8vHcE?t=483"),
  new PLLAlgorithm("341224133412", "s08 s13", "F (R U' R' U') (R U R' F') (R U R' U') (R' F R F')", "https://youtu.be/HWIQdX8vHcE?t=500"),
  new PLLAlgorithm("113442331224", "s26 s35", "(RUR'U)(RUR'F')(RUR'U')(R'FR2U') R' U2 (RU'R')", "https://youtu.be/HWIQdX8vHcE?t=518"),
  new PLLAlgorithm("311244133422", "s08 s35", "(R' U R U') (R' F' U' F) (R U R' F) R' F' (R U' R)", "https://youtu.be/HWIQdX8vHcE?t=562")
};
PLLAlgorithm[] g_perms = {
  new PLLAlgorithm("243412334121", "m02 m26 m60 m13 m35 m51", "R2 U (R' U R' U') (R U' R2) D U' (R' U R D') [U]", "https://youtu.be/HWIQdX8vHcE?t=599"),
  new PLLAlgorithm("424142331213", "m20 m06 m62 m15 m53 m31", "(F' U' F) (R2 u R' U) (R U' R u') R2'", "https://youtu.be/HWIQdX8vHcE?t=632"),
  new PLLAlgorithm("411234142323", "m06 m68 m80 m35 m57 m73", "R2 U' (R U' R U) (R' U R2 D') (U R U' R') D [U']", "https://youtu.be/HWIQdX8vHcE?t=674"),
  new PLLAlgorithm("243422314131", "m02 m26, m60 m13 m37 m71", "D' (R U R' U') D (R2 U' R U') (R' U R' U) R2 [U]", "https://youtu.be/HWIQdX8vHcE?t=713")
};


OLLAlgorithmGroup[] ollAlgorithmGroups = {
  new OLLAlgorithmGroup("All Edges Oriented", all_edges_oriented),
  new OLLAlgorithmGroup("T-Shapes", t_shapes),
  new OLLAlgorithmGroup("Squares", squares),
  new OLLAlgorithmGroup("C-Shapes", c_shapes),
  new OLLAlgorithmGroup("W-Shapes", w_shapes),
  new OLLAlgorithmGroup("Corners Correct", corners_correct),
  new OLLAlgorithmGroup("P-Shapes", p_shapes),
  new OLLAlgorithmGroup("I-Shapes", i_shapes),
  new OLLAlgorithmGroup("Fish Shapes", fish_shapes),
  new OLLAlgorithmGroup("Knight Move Shapes", knight_move_shapes),
  new OLLAlgorithmGroup("Awkward Shapes", awkward_shapes),
  new OLLAlgorithmGroup("L-Shapes", l_shapes),
  new OLLAlgorithmGroup("Lightning Bolts", lightning_bolts),
  new OLLAlgorithmGroup("No Edges Flipped", no_edges)
};
PLLAlgorithmGroup[] pllAlgorithmGroups = {
  new PLLAlgorithmGroup("Edges Only", edges_only),
  new PLLAlgorithmGroup("Corners Only", corners_only),
  new PLLAlgorithmGroup("Adjacent Corners", adjacent_corners),
  new PLLAlgorithmGroup("Diagonal Corners", diagonal_corners),
  new PLLAlgorithmGroup("G Permutations", g_perms)
};


// FILE LAYOUT:
// Current Practice Type -> [oll] or [pll]
// Current OLL Alg Index -> [#]
// Current OLL Tab Index -> [#]
// Current PLL Alg Index -> [#]
// Current PLL Tab Index -> [#]
// OLL Panel 1 -> [NAME~tftttftf...]
// OLL Panel 2 -> [NAME~tttttttt...]
// OLL Panel 3 -> [NAME~ffffffff...]
// PLL Panel 1 -> [NAME~tftttftf...]
// PLL Panel 2 -> [NAME~tttttttt...]
// PLL Panel 3 -> [NAME~ffffffff...]

void loadSaveFile() {
  String[] loadFile = loadStrings("settings.txt");
  
  // Handle a damaged save file (only check the first 5 lines, the rest are handled when loading the tabs)
  if(loadFile.length < 5) {
    println("The settings file looks pretty damaged. This should be fixed the next time you write the file.");
  }
  else {
    practiceType = loadFile[0];
    currentOLLAlgorithm = Integer.parseInt(loadFile[1]); // Restore selected oll algorithm
    currentOLLTab = Integer.parseInt(loadFile[2]); // Restore selected oll tab
    currentPLLAlgorithm = Integer.parseInt(loadFile[3]); // Restore selected pll algorithm
    currentPLLTab = Integer.parseInt(loadFile[4]); // Restore selected pll tab
  }
  
  // Load oll tabs
  for(int tab = 0; tab < ollTabs.length; tab++) {
    // Handle insufficient tab entries in save file
    if(tab >= loadFile.length - 5) {
      println("Not enough oll tab entries. This should be fixed the next time you write the file.");
      ollTabs[tab].Init("Tab", ollAlgorithms.length); // Initialize it with a genaric name
    }
    else {
      String[] splittedTabString = loadFile[tab + 5].split("~");
      ollTabs[tab].Init(splittedTabString[0], ollAlgorithms.length); // Init tab with name and number of selections
      
      // Handle missing split symbol
      if(splittedTabString.length < 2) {
        splittedTabString = new String[2];
        splittedTabString[1] = "";
      }
      
      for(int i = 0; i < ollTabs[tab].selections.length; i++) {
        // Handle insufficient selection entries in save file
        if(i >= splittedTabString[1].length()) {
          println("Not enough oll selection entries. This should be fixed the next time you write the file.");
          break;
        }
        
        ollTabs[tab].selections[i] = splittedTabString[1].charAt(i) == 't';
      }
    }
  }
  DoubleCheckOLLAlgorithmGroupSelction();
  
  // Load pll tabs
  for(int tab = 0; tab < pllTabs.length; tab++) {
    // Handle insufficient tab entries in save file
    if(tab >= loadFile.length - ollTabs.length - 5) {
      println("Not enough pll tab entries. This should be fixed the next time you write the file.");
      pllTabs[tab].Init("Tab", pllAlgorithms.length); // Initialize it with a genaric name
    }
    else {
      String[] splittedTabString = loadFile[tab + ollTabs.length + 5].split("~");
      pllTabs[tab].Init(splittedTabString[0], pllAlgorithms.length); // Init tab with name and number of selections
      
      // Handle missing split symbol
      if(splittedTabString.length < 2) {
        splittedTabString = new String[2];
        splittedTabString[1] = "";
      }
      
      for(int i = 0; i < pllTabs[tab].selections.length; i++) {
        // Handle insufficient selection entries in save file
        if(i >= splittedTabString[1].length()) {
          println("Not enough pll selection entries. This should be fixed the next time you write the file.");
          break;
        }
        
        pllTabs[tab].selections[i] = splittedTabString[1].charAt(i) == 't';
      }
    }
  }
  DoubleCheckPLLAlgorithmGroupSelction();
  
}

void writeSaveFile() {
  String[] fileOutput = new String[5 + ollTabs.length + pllTabs.length];
  fileOutput[0] = practiceType;
  fileOutput[1] = str(currentOLLAlgorithm); // Current oll algorithm
  fileOutput[2] = str(currentOLLTab); // Current oll tab
  fileOutput[3] = str(currentPLLAlgorithm); // Current pll algorithm
  fileOutput[4] = str(currentPLLTab); // Current pll tab
  
  // OLL Tab Selections
  for(int tab = 0; tab < ollTabs.length; tab++) {
    String tabSelections = ollTabs[tab].name + "~";
    for(int i = 0; i < ollTabs[tab].selections.length; i++) {
      tabSelections += ollTabs[tab].selections[i] ? 't' : 'f';
    }
    fileOutput[5 + tab] = tabSelections;
  }
  
  // PLL Tab Selections
  for(int tab = 0; tab < pllTabs.length; tab++) {
    String tabSelections = pllTabs[tab].name + "~";
    for(int i = 0; i < pllTabs[tab].selections.length; i++) {
      tabSelections += pllTabs[tab].selections[i] ? 't' : 'f';
    }
    fileOutput[5 + ollTabs.length + tab] = tabSelections;
  }
  
  saveStrings("settings.txt", fileOutput);
}
