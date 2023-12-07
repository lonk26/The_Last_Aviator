/// @description Insert description here
// You can write your code in this editor

alarm[1] = game_get_speed(gamespeed_fps) * tmr_speed

var _rand = random_range(0,100)

var _fighters = instance_number(obj_enemy_fighter)
var _bombers = instance_number(obj_enemy_bomber)

var _player_x

if instance_exists(obj_player) {
	_player_x = obj_player.x
	if _rand <= fighter_spawnrate * 100 or _fighters == 0{
		spawn_enemy(_player_x-1200, _player_x+1200, "fighter")
	}

	if _rand <= bomber_spawnrate * 100 or _bombers == 1 {
		spawn_enemy(_player_x-1200, _player_x+1200, "bomber")
	}
}