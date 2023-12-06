	draw_set_alpha(1.0)
	
	if button_state == "selected" and button_active == true {
		sprite_index = spr_button_selected
		draw_self()
		draw_set_color(c_black)
		draw_set_font(fnt_menu)

		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)

		draw_text(x, y, button_text)

		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	} else if button_state == "unselected" and button_active == true {
		sprite_index = spr_button
		draw_self()
		draw_set_color(c_white)
		draw_set_font(fnt_menu)

		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)

		draw_text(x, y, button_text)

		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	}
