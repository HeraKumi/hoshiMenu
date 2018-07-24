#include <ncurses.h>

int main(int argc, char** argv){
  initscr();

  int height, width, x, y;
  height = 10;
  width = 20;
  x = 10;
  y = 10;

  WINDOW * win = newwin(height, width, y, x);
  refresh();

  box(win, 0, 0);
  mvwprintw(win, 1, 1, "hello Github!");

  wrefresh(win);

  int c = getch();

  endwin();
  return 0;
}
