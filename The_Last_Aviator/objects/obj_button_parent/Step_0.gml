/// @description Insert description here
// You can write your code in this editor

if button_active == false {
	visible = false	
} else {
	visible = true
	// Check if the mouse is on a button
    var isHovered = position_meeting(mouse_x, mouse_y, self);

    // Check if the mouse has entered the button area
    if isHovered and !mouse_over_button {
        mouse_over_button = true;
        audio_play_sound(snd_buttonHover, 1, false);
    }

    // Check if the mouse has left the button area
    if !isHovered {
        mouse_over_button = false;
    }

    // Set the button state
    button_state = isHovered ? "selected" : "unselected";
}
