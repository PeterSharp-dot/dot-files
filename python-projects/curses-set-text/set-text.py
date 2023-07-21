#!/usr/bin/env python

import curses
def setDot(verse, column):
    # Inicjalizacja ekranu i trybu curses
    screen = curses.initscr()
    curses.curs_set(0)

    # Włączenie obsługi kolorów
    curses.start_color()

    # Zdefiniowanie kolorów
    curses.init_pair(1, curses.COLOR_YELLOW, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_GREEN, curses.COLOR_BLACK)

    # Ustawienie rozmiaru okna
    height, width = 26, 70
    start_y, start_x = 1, 2

    # Tworzenie nowego okna
    newwin = curses.newwin(height, width, start_y, start_x)

    # Dodanie ramki w kolorze
    newwin.attrset(curses.color_pair(2)) # Ustawia kolor pary atrybutów
    newwin.box()
    newwin.attroff(curses.color_pair(2)) # Wyłącza ustawiony wcześniej kolor

    # Wypisanie tekstu na nowym oknie
    text = "."
    newwin.addstr(verse,column, text, curses.color_pair(1))  # pierwsza=wiersze, druga=kolumny

    # Odświeżenie ekranu
    newwin.refresh()

    # Oczekiwanie na naciśnięcie dowolnego klawisza
    newwin.getch()

    # Przywrócenie normalnego trybu terminala
    curses.endwin()
    
setDot(12,35)
