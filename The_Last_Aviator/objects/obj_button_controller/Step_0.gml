/// @description Insert description here
// You can write your code in this editor

switch menu_state {
	
	case MENU_STATES.DEFAULT:
	show_debug_message("default")
	// Visible buttons
		obj_button_play.button_active = true
		obj_button_controls.button_active = true
		obj_button_exit.button_active = true
		
	// Invisible buttons
		obj_button_back.button_active = false
		obj_button_play_campaign.button_active = false
		obj_button_play_endless.button_active = false
		break;
		
	case MENU_STATES.PLAY:
	// Visible buttons
		obj_button_play_campaign.button_active = true
		obj_button_play_endless.button_active = true
		obj_button_back.button_active = true
		
	// Invisible buttons
		obj_button_play.button_active = false
		obj_button_controls.button_active = false
		obj_button_exit.button_active = false
		break;
	
	case MENU_STATES.CONTROLS:
	// Visible buttons
		obj_button_back.button_active = true
		
	// Invisible buttons
		obj_button_play.button_active = false
		obj_button_controls.button_active = false
		obj_button_exit.button_active = false
		obj_button_play_campaign.button_active = false
		obj_button_play_endless.button_active = false
		break;
	
}
