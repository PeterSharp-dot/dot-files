#!/usr/bin/python
import gi
gi.require_version('Notify', '0.7')
from gi.repository import Notify
Notify.init("Hello world")
tytul ="Cześć"
zawart = "Cześć pytonie"
#Hello = Notify.Notification.new("Hello world", "This is an example notification.", "dialog-information")
Hello = Notify.Notification.new(tytul, zawart, "dialog-information")
Hello.show()
