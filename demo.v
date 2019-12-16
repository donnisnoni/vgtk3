import gtk

fn btn_clicked(w &gtk.Widget, btn &gtk.Button) {
	//btn := data[0]

	// The GtkWidget object should be ignored
	if (btn.get_label() == "VGTK3 is ..") {
		btn.set_label("VGTK3 is awesome!")
	} else {
		btn.set_label("VGTK3 is ..")
	}
}

fn menu_exit(w &gtk.Widget, mi &gtk.MenuItem) {
	gtk.main_quit()
}

fn alert_clicked(w &gtk.Widget, btn &gtk.Button) {
	btn.set_label("All Fine!")
}

fn win_destroy(w &gtk.Widget, win &gtk.Window) {
	gtk.main_quit() // necessary as gtk won't exit itself when window is destroyed.
}

fn main() {
	window := gtk.new_window()
	vbox := gtk.new_vbox(false, 20)
	align := gtk.new_alignment(0, 0, 1, 1)
	btn := gtk.new_button("VGTK3 is ..")
	btn2 := gtk.new_button("I'm useless!")
	alert := gtk.new_button("Alert!")

	bar := gtk.new_menu_bar()
	menu := gtk.new_menu()
	file_me := gtk.new_menu_item_with_label("File")
	quit := gtk.new_menu_item_with_label("Quit")
	file_me.set_submenu(menu)
	menu.append(quit)
	bar.append(file_me)

	hbox := gtk.new_hbox(false, 20)
	entry := gtk.new_entry()

	btn.set_size(200, 100)
	btn2.set_size(100, 50)
	alert.set_size(80, 20)
	entry.set_text("Good Night!")
	//entry.set_visibility(false)
	//entry.set_invisible_char('*')
	btn.on("clicked", btn_clicked)

	gtk.accel_map_add_entry("GTK-Test/File/Quit", 65, 0)
	quit.set_accel_path("GTKTest/File/Quit")
	quit.set_use_underline(true)
	quit.on("activate", menu_exit)

	alert.on("clicked", alert_clicked)

	hbox.add(entry)
	hbox.add(alert)

	vbox.add(bar)
	vbox.add(btn)
	vbox.add(btn2)
	vbox.add(hbox)
	align.add(vbox)

	//window.set_size(640, 480)
	window.set_position(.center)
	window.set_title("I'm made with V")
	window.add(align)
	window.on("destroy", win_destroy)
	window.show()
	gtk.main()
}