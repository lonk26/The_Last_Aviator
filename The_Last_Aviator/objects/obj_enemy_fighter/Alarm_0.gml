/// @description Insert description here
// You can write your code in this editor

if fighter_state != STATES.DESTROYED {
	fighter_state = STATES.REGULAR
	chasing_cooldown = true
	alarm[1] = 150
}