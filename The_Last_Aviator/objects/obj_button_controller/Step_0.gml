/// @description Insert description here
// You can write your code in this editor

switch menu_state {
	
	case MENU_STATES.DEFAULT:
		instance_create_layer(1280, 600, "Buttons", obj_button_play)
		instance_create_layer(1280, 800, "Buttons", obj_button_controls)
		instance_create_layer(1280, 1000, "Buttons", obj_button_exit)
	
	case MENU_STATES.PLAY:
		
	
	case MENU_STATES.CONTROLS:
		
	
}
