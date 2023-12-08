/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_player) and keyboard_check_pressed(ord("R")) {
	score = 0
	room_restart()
}

if !instance_exists(obj_player) and keyboard_check_pressed(vk_escape) {
	room_goto(rm_menu)	
}

if room == rm_mission_1 and !instance_exists(obj_enemy_fighter) and room_continue == true {
	room_goto(rm_mission_2)
}

if room == rm_mission_2 and !instance_exists(obj_enemy_fighter) and !instance_exists(obj_enemy_bomber) and room_continue == true {
	audio_stop_all()
	room_goto(rm_menu)	
}
