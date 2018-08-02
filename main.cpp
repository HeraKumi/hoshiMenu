#include <ncurses.h>
#include <string>
#include <cstring>

using namespace std;

int main(int argc, char** argv){
  initscr();
  //noecho();
  cbreak();

  int yMax, xMax;
  yMax = 20;
  xMax = 15;

  getmaxyx(stdscr, yMax, xMax);

// window creation
  WINDOW * menuWin = newwin(6, xMax-9, yMax-8, 5);
  box(menuWin, 0, 0);

  WINDOW * taskWin = newwin(25, 30, 1, 5);
  box(taskWin, 0, 0);

  WINDOW * ouputWin = newwin(25, 50, 1, 36);
  box(ouputWin, 0, 0);

// window end
  refresh();
  wrefresh(menuWin);
  wrefresh(taskWin);
  wrefresh(ouputWin);


  keypad(menuWin, true);
  string items[4] = { "Arch Linux", "Deepin", "Update", "Exit" };
  int item;
  int highlight = 0;

  while (1) {
    for (int i = 0; i < 4; i++) {
      if (i == highlight) {
        wattron(menuWin, A_REVERSE);
      }
      mvwprintw(menuWin, i+1, 1, items[i].c_str());
      wattroff(menuWin, A_REVERSE);
    }
    item = wgetch(menuWin);

    switch (item) {
      case KEY_UP:
        highlight--;
        if (highlight == -1) {
          highlight = 0;
        }
        break;
      case KEY_DOWN:
        highlight++;
        if (highlight == 4) {
          highlight = 1;
        }
        break;
      default:
        break;
    }
    if (item == 10) {
      break;
    }
  }
  refresh();

  // Add other stuff


  refresh();

  keypad(taskWin, true);
  string deepinOptions[5] = { "Remove bloatware", "Update system", "Setup C++ environment", "Setup C# environment", "Anime Wallpaper GET" };
  string archLinuxOptions[3] = { "Setup C++ environment", "Update system", "Anime Wallpaper GET" };
  int deepinOption, archLinuxOption;
  int hHighlight = 0;

  if (items[highlight] == "Deepin") {
    while (1) {
      for(int i = 0; i < 5; i++){
        if (i == hHighlight){
          wattron(taskWin, A_REVERSE);
        }
        mvwprintw(taskWin, i+1, 1, deepinOptions[i].c_str());
        wattroff(taskWin, A_REVERSE);
      }
      deepinOption = wgetch(taskWin);
      switch (deepinOption) {
        case KEY_UP:
          hHighlight--;
          break;
        case KEY_DOWN:
          hHighlight++;
          break;
        default:
          break;
      }
      if (deepinOption == 10){
        break;
      }
    }
  } else if (items[highlight] == "Arch Linux"){
    while (1) {
      for(int i = 0; i < 3; i++){
        if(i == hHighlight){
          wattron(taskWin, A_REVERSE);
        }
        mvwprintw(taskWin, i+1, 1, archLinuxOptions[i].c_str());
        wattroff(taskWin, A_REVERSE);
      }
      archLinuxOption = wgetch(taskWin);
      switch (archLinuxOption) {
        case KEY_UP:
          hHighlight--;
          break;
        case KEY_DOWN:
          hHighlight++;
          break;
        default:
          break;
      }
      if (archLinuxOption == 10) {
        break;
      }
    }
  }

  if (archLinuxOptions[hHighlight] == "Anime Wallpaper GET") { // This works
    string mesg = "Enter download dir: ";
    char str[80];
    int row  = 1, col = 1;
 
    refresh();
    getmaxyx(stdscr,row,col);
    
    wrefresh(ouputWin);
    mvwprintw(ouputWin, 2, 1, "Downloading to: %s", str);
    wrefresh(ouputWin);

    // curl - http stuff
    // TODO - link curlpp
    
  }
  getch();
  endwin();

  return 0;

}
