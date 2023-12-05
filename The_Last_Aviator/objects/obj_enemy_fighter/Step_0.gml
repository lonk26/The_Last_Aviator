/// Enemy plane behavior

/// ----------------------------- Enemy Fighter Essential Variables ------------------------------

var _distance_to_player = noone
if instance_exists(obj_player) {
	_distance_to_player = distance_to_object(obj_player)
} else {
	fighter_state = STATES.REGULAR	
}

var _direction_x = lengthdir_x(1, image_angle)
var _direction_y = lengthdir_y(1, image_angle)

var _sign = sign(image_xscale)

direction = point_direction(0,0, _direction_x, _direction_y)

var _gravity = 3 * _direction_y

if enemy_health <= 0 and fighter_crash_coordinates == noone {
	fighter_crash_coordinates = get_crash_coordinate(x, y, (sign(_direction_x) * _sign))
	fighter_state = STATES.DESTROYED
}

/// ------------------------------ Enemy Fighter State Code --------------------------------------

if fighter_state = STATES.REGULAR {
	plane_speed = default_speed
	
	if _distance_to_player < 300 and chasing_cooldown == false {
		fighter_state = STATES.CHASING	
		alarm[0] = random_range(150, 210)
	}
	

	if true {
		
		var _flight_direction = point_direction(0, 0, _direction_x * _sign, 0)
		
		var _angle_diff = angle_difference(image_angle, _flight_direction)
		
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
	
}

if fighter_state = STATES.CHASING and instance_exists(obj_player) {
	
	var _direction_to_player = point_direction(x, y, obj_player.x, obj_player.y)
	
	var _angle_diff = angle_difference(image_angle, _direction_to_player)
	
	
	/// Variation accounts for enemy getting inverted if hitting a border
	if ((abs(_angle_diff) < 178 or abs(_angle_diff) > 182)) and _sign == -1 {
		var _turning_direction = sign(_angle_diff)
		
		if _turning_direction > 0 {
			image_angle += (1.0 + 1.0 * abs(speed / 7.0))
		} else {
			image_angle -= (1.0 + 1.0 * abs(speed / 7.0)) 
		}
	} else if ((abs(_angle_diff) < 0.0 or abs(_angle_diff) > 2)) and _sign	== 1 {
		var _turning_direction = sign(_angle_diff)
			
		if _turning_direction > 0 {
			image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
		} else {
			image_angle += 1.0 + 1.0 * abs(speed / 7.0)
		}
	} else {
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
					create_bullet(x + _gun_xoffset, y + _gun_yoffset, image_angle, sign(speed), "enemy", 5)
					bullets_fired += 1
					firing_cooldown = true
					alarm[2] = 10
			}
			if bullets_fired == burst_bullets {
				burst_cooldown = true
				bullets_fired = 0
				alarm[3] = 60
			}
		}
	}
	
	if _distance_to_player < 100 and plane_speed > default_speed - 1 {
		plane_speed -= 0.1
	} else if _distance_to_player > 100 and plane_speed < default_speed {
		plane_speed += 0.1	
	}
}

if fighter_state = STATES.DESTROYED {
	
	var _crash_direction = point_direction(x, y, fighter_crash_coordinates[0], fighter_crash_coordinates[1])
	
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

if ((x  < -50 or x > room_width + 50)) {
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
