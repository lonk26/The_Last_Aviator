/// @description Insert description here
// You can write your code in this editor

if enemy_state != STATES.DESTROYED {
	enemy_state = STATES.REGULAR
	chasing_cooldown = true
	alarm[1] = 150
}