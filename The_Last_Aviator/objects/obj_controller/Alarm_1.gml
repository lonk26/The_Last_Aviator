/// @description Insert description here
// You can write your code in this editor

alarm[1] = game_get_speed(gamespeed_fps) * tmr_speed

var _rand = random_range(0,100)

var _fighters = instance_number(obj_enemy_fighter)
var _bombers = instance_number(obj_enemy_bomber)

var _fighter_limit = int64(score/2500) + 1

var _bomber_limit = int64(score/5000) + 1

var _player_x

if instance_exists(obj_player) {
	_player_x = obj_player.x
	if _rand <= fighter_spawnrate * 100 and _fighters < _fighter_limit {
		spawn_enemy(_player_x-1200, _player_x+1200, "fighter")
	}

	if _rand <= bomber_spawnrate * 100 and _bombers < _bomber_limit {
		spawn_enemy(_player_x-1200, _player_x+1200, "bomber")
	}
}