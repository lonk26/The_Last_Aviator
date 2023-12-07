/// Enemy plane behavior

var _distance_to_player = noone
if instance_exists(obj_player) {
	_distance_to_player = distance_to_object(obj_player)
}

var _direction_x = lengthdir_x(1, image_angle)
var _direction_y = lengthdir_y(1, image_angle)

var _sign = sign(image_xscale)

direction = point_direction(0,0, _direction_x, _direction_y)

var _gravity = 3 * _direction_y

if enemy_health <= 0 and bomber_crash_coordinates == noone {
	bomber_crash_coordinates = get_crash_coordinate(x, y, (sign(_direction_x) * _sign))
	bomber_state = STATES.DESTROYED
	create_particle(x, y, "aircraft")
	score += 100
	if room = rm_endless {
		var _rand = random_range(0,100)
		if _rand < obj_controller.health_spawnrate * 2 * 100 {
			instance_create_layer(x,y, "Instances", obj_health)	
		}
	}
}

if enemy_health <= 100 and create_smoke == true {
	create_smoke = false
	create_particle(x, y, "smoke")
	alarm[3] = 30
}

/// ------------------------------ Enemy Fighter State Code --------------------------------------

if bomber_state = STATES.REGULAR {
	
	if true {
		var _level_flight_direction = point_direction(0, 0, _direction_x * _sign, 0)
		
		var _angle_diff = angle_difference(image_angle, _level_flight_direction)
		
		
		/// Variation accounts for enemy getting inverted if hitting a border
		if ((abs(_angle_diff) < 178 or abs(_angle_diff) > 182)) and _sign == -1 {
			var _turning_direction = sign(_angle_diff)
			
			if _turning_direction > 0 {
				image_angle += 1.0 + 1.0 * abs(speed / 7.0)
			} else {
				image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
			}
		}
		
		if ((abs(_angle_diff) < 0.0 or abs(_angle_diff) > 2)) and _sign == 1 {
			var _turning_direction = sign(_angle_diff)
			
			if _turning_direction > 0 {
				image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
			} else {
				image_angle += 1.0 + 1.0 * abs(speed / 7.0)
			}
		}
	}
	
	if _distance_to_player != noone {
		if _distance_to_player < 900 {
			if !burst_cooldown {
					if !firing_cooldown {
						var _gun_offset
						var _gun_xoffset
						var _gun_yoffset
						if _sign == 1 {
							_gun_offset = 20
							_gun_xoffset = _gun_offset * lengthdir_x(1.25, image_angle + 45)
							_gun_yoffset = _gun_offset * lengthdir_y(1.5, image_angle + 45)
						} else {
							_gun_offset = 10
							_gun_xoffset = _gun_offset * _sign * lengthdir_x(1, image_angle)
							_gun_yoffset = _gun_offset * _sign * lengthdir_y(1.5, image_angle + 45)
						}
						
						create_bullet(x + _gun_xoffset, y + _gun_yoffset, point_direction(x + _gun_xoffset, y +_gun_yoffset, obj_player.x, obj_player.y), 1, "enemy", bullet_damage)
						audio_play_sound(snd_enemyFire,1,false,1,0,0.2)
						bullets_fired += 1
						firing_cooldown = true
						alarm[0] = 10
				}
				if bullets_fired == burst_bullets {
					burst_cooldown = true
					bullets_fired = 0
					alarm[1] = random_range(120, 210)
				}
			}
		}
	}
	
}

if bomber_state = STATES.DESTROYED {
	audio_play_sound(snd_planeFall,1,false)
	
	var _crash_direction = point_direction(x, y, bomber_crash_coordinates[0], bomber_crash_coordinates[1])
	
	var _angle_diff = angle_difference(image_angle, _crash_direction)
	

	/// Variation accounts for enemy getting inverted if hitting a border
	if ((abs(_angle_diff) < 178 or abs(_angle_diff) > 182)) and _sign == -1 {
		var _turning_direction = sign(_angle_diff)
			
		if _turning_direction > 0 {
			image_angle += 1.0 + 1.0 * abs(speed / 7.0)
		} else {
			image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
		}
	}
		
	if ((abs(_angle_diff) < 0.0 or abs(_angle_diff) > 2)) and _sign == 1 {
		var _turning_direction = sign(_angle_diff)
			
		if _turning_direction > 0 {
			image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
		} else {
			image_angle += 1.0 + 1.0 * abs(speed / 7.0)
		}
	}
}

if _sign == 1 {
	speed = plane_speed + _gravity
} else {
	speed = -plane_speed + _gravity
}

/// ------------------ Forcing aircraft back within game world --------------------------

if ((x  < -200 or x > room_width + 200)) {
	_direction_x *= -1
	direction =  point_direction(0,0, -_direction_x, _direction_y)
	image_xscale *= -1
	//image_yscale *= -1
	speed *= -1
}

if (y < -100) { 
	if sign(_direction_y * _sign) == -1 and sign(_direction_x * _sign) == 1 {
		image_angle -= 100	
		var _temp_y = lengthdir_y(1, image_angle)
		var _temp_x = lengthdir_x(1, image_angle)
		direction =  point_direction(0,0, _temp_x, _temp_y)
	} else {
		image_angle += 100
		var _temp_y = lengthdir_y(1, image_angle)
		var _temp_x = lengthdir_x(1, image_angle)
		direction =  point_direction(0,0, _temp_x, _temp_y)
	}
}
