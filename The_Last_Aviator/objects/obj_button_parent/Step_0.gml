/// @description Insert description here
// You can write your code in this editor

if button_active == false {
	visible = false	
} else {
	visible = true
	if position_meeting(mouse_x, mouse_y, self) {
		button_state = "selected"	
	} else {
		button_state = "unselected"
	}
}
