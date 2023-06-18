#!/usr/bin/env python
import curses

# Inicjalizacja biblioteki curses
stdscr = curses.initscr()

# Włączenie trybu wyświetlania specjalnych znaków (np. kolorów)
curses.start_color()
curses.use_default_colors()

# Definicja koloru
curses.init_pair(1, curses.COLOR_RED, -1)


# tworzenie nowego okna
nwin = curses.newwin(10, 30, 5, 5)

# Włączenie trybu rysowania pojedynczych pikseli
curses.curs_set(0)
curses.mousemask(curses.ALL_MOUSE_EVENTS)

# aktywowanie nowego okna
nwin.box()
nwin.addstr(2, 2, "Kwadrat:")


# Rysowanie prostokąta w lewym górnym rogu o wymiarach 2x2 piksele
nwin.addstr(3, 3, "\u2588", curses.color_pair(1))
nwin.addstr(3, 4, "\u2588", curses.color_pair(1))
nwin.addstr(4, 3, "\u2588", curses.color_pair(1))
nwin.addstr(4, 4, "\u2588", curses.color_pair(1))

# Odświeżenie ekranu
nwin.refresh()

# przejście do trybu obsługi klawiatury
stdscr.keypad(True)

# Oczekiwanie na wciśnięcie klawisza
stdscr.getch()

# Zakończenie pracy z biblioteką curses
curses.endwin()
