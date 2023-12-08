/// @description Insert description here
// You can write your code in this editor

switch menu_state {
	
	case MENU_STATES.DEFAULT:
	// Visible buttons
		obj_button_play.button_active = true
		obj_button_controls.button_active = true
		obj_button_exit.button_active = true
		
	// Invisible buttons
		obj_button_back.button_active = false
		obj_button_play_campaign.button_active = false
		obj_button_play_endless.button_active = false
		obj_element_acceleration.element_active = false
		obj_element_acceleration_tag.element_active = false
		obj_element_movement.element_active = false
		obj_element_movement_tag.element_active = false
		obj_element_shooting.element_active = false
		obj_element_shooting_tag.element_active = false

		break;
		
	case MENU_STATES.PLAY:
	// Visible buttons
		obj_button_play_campaign.button_active = true
		obj_button_play_endless.button_active = true
		obj_button_back.button_active = true
		obj_button_back.y = 896
		
	// Invisible buttons
		obj_button_play.button_active = false
		obj_button_controls.button_active = false
		obj_button_exit.button_active = false
		break;
	
	case MENU_STATES.CONTROLS:
	// Visible buttons
		obj_button_back.button_active = true
		obj_button_back.y = 1056 
		obj_element_acceleration.element_active = true
		obj_element_acceleration_tag.element_active = true
		obj_element_movement.element_active = true
		obj_element_movement_tag.element_active = true
		obj_element_shooting.element_active = true
		obj_element_shooting_tag.element_active = true
		
	// Invisible buttons
		obj_button_play.button_active = false
		obj_button_controls.button_active = false
		obj_button_exit.button_active = false
		obj_button_play_campaign.button_active = false
		obj_button_play_endless.button_active = false
		break;
	
}
