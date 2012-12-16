# GObject Introspection APIs are available from imports.gi.Modulename
@Gtk = imports.gi.Gtk

# For GNOME 3.2+ this should be Gtk.init null, 0
Gtk.init null, 0

win = new Gtk.Window
    type: Gtk.WindowType.TOPLEVEL
win.set_border_width 10
win.connect "destroy", (widget) ->
    Gtk.main_quit()

button = new Gtk.Button
    label: "Hello, world"
button.connect "clicked", ->
    button.set_label "Bar"
win.add button

button.show()
win.show()

Gtk.main()