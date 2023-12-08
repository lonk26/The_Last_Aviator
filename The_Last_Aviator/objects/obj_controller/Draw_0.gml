/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_player) {
	draw_set_halign(fa_center)
	draw_set_font(fnt_menu)
	var _camera = view_camera[0]
	var _gameoverstring = "Game Over! Press R to restart." + "\n" + "Level Score: " + string(score) + "\n" + "Or press 'Esc' to return to main menu"
	draw_text(camera_get_view_x(_camera) + camera_get_view_width(_camera) * 0.5, 
				camera_get_view_y(_camera) + camera_get_view_height(_camera) * 0.4, _gameoverstring)
}

if room == rm_mission_1 and !instance_exists(obj_enemy_fighter) {
	if instance_exists(obj_level_transition) {
		if obj_level_transition.transition == false {
			obj_level_transition.transition = true	
		}
	}
	draw_set_halign(fa_center)
	draw_set_font(fnt_menu)
	var _camera = view_camera[0]
	var _mission1completestring = "Mission Complete!" + "\n" + "Level Score: " + string(score)
	draw_text(camera_get_view_x(_camera) + camera_get_view_width(_camera) * 0.5, 
				camera_get_view_y(_camera) + camera_get_view_height(_camera) * 0.4, _mission1completestring)
}

if room == rm_mission_2 and !instance_exists(obj_enemy_fighter) and !instance_exists(obj_enemy_bomber) {
	if instance_exists(obj_level_transition) {
		if obj_level_transition.transition == false {
			obj_level_transition.transition = true	
		}
	}
	draw_set_halign(fa_center)
	draw_set_font(fnt_menu)
	var _camera = view_camera[0]
	var _mission1completestring = "Mission Complete!" + "\n" + "Level Score: " + string(score)
	draw_text(camera_get_view_x(_camera) + camera_get_view_width(_camera) * 0.5, 
				camera_get_view_y(_camera) + camera_get_view_height(_camera) * 0.4, _mission1completestring)
}



