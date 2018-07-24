#include <ncurses.h>
#include <string>
using namespace std;

int main(int argc, char** argv){
  initscr();
  noecho();
  cbreak();

  int yMax, xMax;
  yMax = 20;
  xMax = 15;

  getmaxyx(stdscr, yMax, xMax);

  WINDOW * menuWin = newwin(6, xMax-12, yMax-8, 5);
  box(menuWin, 0, 0);
  refresh();
  wrefresh(menuWin);


  keypad(menuWin, true);

  string items[2] = {"Arch Linux", "Deepin"};
  int item;
  int highlight = 0;

  while (1) {
    for (int i = 0; i < 2; i++) {
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
        if (highlight == 2) {
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

  getch();
  endwin();

  return 0;

}
