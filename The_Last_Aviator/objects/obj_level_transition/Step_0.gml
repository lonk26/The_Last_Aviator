/// @description Insert description here
// You can write your code in this editor

if transition == true {
	visible = true
	object_opacity += opacity_update
	if object_opacity >= 1.0 {
		if alarm[0] <= 0 {
			alarm[0] = 60	
		}
	}
}