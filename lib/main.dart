import 'dart:async';  
import 'dart:io';  
import 'dart:math';  

import 'package:dart_console/dart_console.dart';  

// Initialize console and random instance  
final console = Console();  
final random = Random();  

// ANSI escape codes for screen manipulation and cursor visibility  
const String clearScreen = "\x1B[2J\x1B[H";  
const String resetCursor = "\x1B[H";  
const String hideCursor = "\x1B[?25l";  
const String showCursor = "\x1B[?25h";  

// List of background colors for explosions  
const List<String> colors = [  
  "\x1B[45m", // Magenta  
  "\x1B[46m", // Cyan  
  "\x1B[48;5;208m", // Bright Orange  
  "\x1B[48;5;226m", // Bright Yellow  
  "\x1B[48;5;51m",  // Bright Blue  
  "\x1B[48;5;210m", // Light Pink  
  "\x1B[48;5;172m", // Coral  
  "\x1B[48;5;39m",  // Light Green  
  "\x1B[48;5;28m",  // Dark Green  
  "\x1B[48;5;17m",  // Dark Blue  
  "\x1B[48;5;125m", // Purple  
  "\x1B[48;5;187m", // Light Magenta  
  "\x1B[48;5;5m",   // Dark Magenta  
];  

String moveCursor(int row, int col) => "\x1B[${row};${col}H";  

//menampilkan animasi kembang api  
Future<void> showFireworks(int i) async {
  stdout.write(hideCursor);

  int terminalHeight = console.windowHeight;
  int terminalWidth = console.windowWidth;
  int startRow = terminalHeight - 1, positionRow, positionCol;

  const int margin = 2;
  final int maxCol = terminalWidth - margin;
  final int minCol = margin;

  //kembang api dimulai dari bawah dan bergerak ke tengah
  positionRow = terminalHeight ~/ 2;
  if (i == 0) {
    positionCol = terminalWidth ~/ 2;
  } else {
    positionCol = minCol + random.nextInt(maxCol - minCol);
  }

  //animasi meluncurnya kembang api
  for (int row = startRow; row >= positionRow; row--) {
    stdout.write(clearScreen);
    stdout.write(moveCursor(row, positionCol));
    stdout.write("|"); //jejak kembang api
    await Future.delayed(Duration(milliseconds: 100));
  }

  await Future.delayed(Duration(milliseconds: 200));
  var color = getRandomColor();
  stdout.write("${color}${clearScreen}${resetCursor}"); // Set warna latar belakang

  //STEP 1
  stdout.write(moveCursor(positionRow - 1, positionCol));
  stdout.write("${color} *  \x1B[0m");

  stdout.write(moveCursor(positionRow, positionCol - 1));
  stdout.write("${color}* * *\x1B[0m");

  stdout.write(moveCursor(positionRow + 1, positionCol));
  stdout.write("${color} *  \x1B[0m");
  await Future.delayed(Duration(milliseconds: 200));

  //STEP 2
  stdout.write(moveCursor(positionRow - 2, positionCol));
  stdout.write("${color}  *    \x1B[0m");

  stdout.write(moveCursor(positionRow - 1, positionCol - 1));
  stdout.write("${color} * * *  \x1B[0m");

  stdout.write(moveCursor(positionRow, positionCol - 2));
  stdout.write("${color}* * * * *\x1B[0m");

  stdout.write(moveCursor(positionRow + 1, positionCol - 1));
  stdout.write("${color} * * *  \x1B[0m");

  stdout.write(moveCursor(positionRow + 2, positionCol));
  stdout.write("${color}  *    \x1B[0m");
  await Future.delayed(Duration(milliseconds: 200));

  //STEP 3
  stdout.write(moveCursor(positionRow - 3, positionCol));
  stdout.write("${color}   *     \x1B[0m");

  stdout.write(moveCursor(positionRow - 2, positionCol));
  stdout.write("${color}   *     \x1B[0m");

  stdout.write(moveCursor(positionRow - 1, positionCol - 1));
  stdout.write("${color}  * * *   \x1B[0m");

  stdout.write(moveCursor(positionRow, positionCol - 2));
  stdout.write("${color}* * * * * *\x1B[0m");

  stdout.write(moveCursor(positionRow + 1, positionCol - 1));
  stdout.write("${color}  * * *   \x1B[0m");

  stdout.write(moveCursor(positionRow + 2, positionCol));
  stdout.write("${color}   *     \x1B[0m");

  stdout.write(moveCursor(positionRow + 3, positionCol));
  stdout.write("${color}   *     \x1B[0m");
  await Future.delayed(Duration(milliseconds: 200));

  //STEP 4
  stdout.write(moveCursor(positionRow - 4, positionCol));
  stdout.write("${color}    *       \x1B[0m");

  stdout.write(moveCursor(positionRow - 3, positionCol));
  stdout.write("${color}    *       \x1B[0m");

  stdout.write(moveCursor(positionRow - 2, positionCol - 2));
  stdout.write("${color}  *   *   *    \x1B[0m");

  stdout.write(moveCursor(positionRow - 1, positionCol - 1));
  stdout.write("${color}   * * *     \x1B[0m");

  stdout.write(moveCursor(positionRow, positionCol - 3));
  stdout.write("${color}* * * * * * * *\x1B[0m");

  stdout.write(moveCursor(positionRow + 1, positionCol - 1));
  stdout.write("${color}   * * *     \x1B[0m");

  stdout.write(moveCursor(positionRow + 2, positionCol - 2));
  stdout.write("${color}  *   *   *   \x1B[0m");

  stdout.write(moveCursor(positionRow + 3, positionCol));
  stdout.write("${color}    *       \x1B[0m");

  stdout.write(moveCursor(positionRow + 4, positionCol));
  stdout.write("${color}    *       \x1B[0m");
  await Future.delayed(Duration(milliseconds: 200));

  //STEP 5
  stdout.write(moveCursor(positionRow - 4, positionCol));
  stdout.write("${color}    *    \x1B[0m");

  stdout.write(moveCursor(positionRow - 3, positionCol));
  stdout.write("${color}    *    \x1B[0m");

  stdout.write(moveCursor(positionRow - 2, positionCol - 2));
  stdout.write("${color}   *  *  *   \x1B[0m");

  stdout.write(moveCursor(positionRow - 1, positionCol - 1));
  stdout.write("${color}   *   *    \x1B[0m");

  stdout.write(moveCursor(positionRow, positionCol - 3));
  stdout.write("${color}* * *    * * *\x1B[0m");

  stdout.write(moveCursor(positionRow + 1, positionCol - 1));
  stdout.write("${color}   *   *    \x1B[0m");

  stdout.write(moveCursor(positionRow + 2, positionCol - 2));
  stdout.write("${color}   *  *  *   \x1B[0m");

  stdout.write(moveCursor(positionRow + 3, positionCol));
  stdout.write("${color}    *    \x1B[0m");

  stdout.write(moveCursor(positionRow + 4, positionCol));
  stdout.write("${color}    *    \x1B[0m");
  await Future.delayed(Duration(milliseconds: 200));

  //STEP 6
  stdout.write(moveCursor(positionRow - 2, positionCol - 1));
  stdout.write("${color}  *     *   \x1B[0m");

  stdout.write(moveCursor(positionRow, positionCol - 3));
  stdout.write("${color}*            *\x1B[0m");

  stdout.write(moveCursor(positionRow + 2, positionCol - 1));
  stdout.write("${color}  *     *   \x1B[0m");
  await Future.delayed(Duration(milliseconds: 200));

  stdout.write(clearScreen); 

  await Future.delayed(Duration(milliseconds: 500));
  stdout.write(showCursor); 
}

//FUNCTION HBD
Future<void> showHBDANO(int terminalWidth, int terminalHeight) async {
  stdout.write("\x1B[2J\x1B[0m");
  
  List<String> hbdano = [
    "H       H  BBBBBBBB   DDDDDDDD            A        N N        N    O O O O    !!",
    "H       H  B       B  D       D          A A       N  N       N   O       O   !!",
    "H       H  B       B  D        D        A   A      N   N      N  O         O  !!",
    "HHHHHHHHH  BBBBBBBB   D        D       A     A     N    N     N  O         O  !!",
    "H       H  B       B  D        D      A A A A A    N     N    N  O         O  !!",
    "H       H  B       B  D       D      A         A   N      N   N   O       O   !!",
    "H       H  BBBBBBBB   DDDDDDDD      A           A  N        N N    O O O O    .."
  ];
  
  int startRow = terminalHeight - 1; 
  int positionCol = (terminalWidth ~/ 2) - (hbdano[0].length ~/ 2); 

  for (int row = startRow; row >= 0; row--) {
    stdout.write(clearScreen); 
    
    for (int i = 0; i < hbdano.length; i++) {
      int currentRow = row + i + 1;
      if (currentRow >= 0 && currentRow < terminalHeight) {
        stdout.write(moveCursor(currentRow, positionCol));
        stdout.writeln(hbdano[i]);
      }
    }
    await Future.delayed(Duration(milliseconds: 200));
  }
  

  stdout.write("\x1B[0m"); 
}

String getRandomColor() {  
  return colors[random.nextInt(colors.length)];  
}  

void main() async {  
  stdout.write("Masukkan banyak kembang api mu! : ");
   int? ulang = int.tryParse(stdin.readLineSync()!); 
  if (ulang == null || ulang <= 0) {
    print("Jumlah kembang api tidak valid. Harap masukkan angka yang lebih besar dari 0.");
    return; 
  }

  stdout.write(clearScreen); 
  for (var i = 0; i < ulang; i++) {
    await showFireworks(i); 
  }
  
  await showHBDANO(console.windowWidth, console.windowHeight); 
  stdout.write(showCursor);
}