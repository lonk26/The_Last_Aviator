/// @description Insert description here
// You can write your code in this editor


if instance_exists(obj_player) {
	var _border_size = 4
	
	var _text_x = 60
	var _text_y = 60
	
	draw_set_font(fnt_GUI);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_colour(c_white);
	
	var _score_text = "SCORE: " + string(score)
	var _index = 0
	
	draw_text(_text_x, _text_y, _score_text)
}


if !instance_exists(obj_player) and room != rm_menu {
	
}


