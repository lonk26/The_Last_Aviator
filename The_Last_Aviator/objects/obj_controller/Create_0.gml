/// @description Insert description here
// You can write your code in this editor

/// Enemies use a State system to determine behavior
enum STATES {
	REGULAR = 0,
	CHASING = 1,
	DESTROYED = 2
}

score = 0

room_continue = false

if room == rm_endless {
	alarm[1] = game_get_speed(gamespeed_fps) * tmr_speed
}