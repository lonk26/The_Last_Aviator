// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_enemy(_player_x_left, _player_x_right, _type) {
	var _spawn_x = noone
	var _spawn_y
	var _facing 
	
	if _player_x_left < 100 {
		_spawn_x = _player_x_right + 200	
		_facing = -1
	} else if _player_x_right > 3740 {
		_spawn_x = _player_x_left - 200
		_facing = 1
	}
	
	var _rand = irandom(1)
	
	switch _type {
		case "fighter":
			_spawn_y = random_range(100, 900)
			if _spawn_x == noone {
				if _rand == 1 {
					_spawn_x = _player_x_right
					_facing = -1
				} else {
					_spawn_x = _player_x_left
					_facing = 1
				}
			} else {
				_spawn_y = random_range(150, 850)
			}
			show_debug_message("spawning fighter")
			var _fighter = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_enemy_fighter)
			_fighter.image_xscale = _facing	
			break
			
		case "bomber":
			_spawn_y = random_range(100, 900)
			if _spawn_x == noone {
				if _rand == 1 {
					_spawn_x = _player_x_right
					_facing = -1
				} else {
					_spawn_x = _player_x_left
					_facing = 1
				}
			} else {
				_spawn_y = random_range(150, 850)
			}
			show_debug_message("spawning bomber")
			var _bomber = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_enemy_bomber)
			_bomber.image_xscale = _facing	
			break
	}
}