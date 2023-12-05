/// Plays the game

/// Used Gamemaker official tutorial https://www.youtube.com/watch?v=Us5GSddVedY&ab_channel=GameMaker to help
/// with initial implementation

// Inherit the parent event
event_inherited();

if button_active == true {
	obj_button_controller.menu_state = MENU_STATES.PLAY
}