/// Enemy plane behavior

/// ----------------------------- Enemy Fighter Essential Variables ------------------------------

var _distance_to_player = distance_to_object(obj_player)

var _direction_x = lengthdir_x(1, image_angle)
var _direction_y = lengthdir_y(1, image_angle)

var _sign = sign(image_xscale)

direction = point_direction(0,0, _direction_x, _direction_y)

var _gravity = 3 * _direction_y

if health <= 0 and crash_coordinates == noone {
	crash_coordinates = get_crash_coordinate(x, y, (sign(_direction_x) * _sign))
	enemy_state = STATES.DESTROYED
}

show_debug_message("sign: " + string(_sign))

/// ------------------------------ Enemy Fighter State Code --------------------------------------

if enemy_state = STATES.REGULAR {
	plane_speed = default_speed
	
	if _distance_to_player < 300 and chasing_cooldown == false {
		enemy_state = STATES.CHASING	
		alarm[0] = 180
	}
	

	if true {
		var _level_flight_direction = point_direction(0, 0, _direction_x * _sign, 0)
		
		var _angle_diff = angle_difference(image_angle, _level_flight_direction)
		
		show_debug_message(abs(_angle_diff) % 180)
		
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

if enemy_state = STATES.CHASING {
	var _direction_to_player = point_direction(x, y, obj_player.x, obj_player.y)
	
	var _angle_diff = angle_difference(image_angle, _direction_to_player)
	
	show_debug_message(abs(_angle_diff) % 180)
	
	/// Variation accounts for enemy getting inverted if hitting a border
	if ((abs(_angle_diff) < 178 or abs(_angle_diff) > 182)) and _sign == -1 {
		var _turning_direction = sign(_angle_diff)
		
		if _turning_direction > 0 {
			image_angle += (1.0 + 1.0 * abs(speed / 7.0))
		} else {
			image_angle -= (1.0 + 1.0 * abs(speed / 7.0)) 
		}
	}
	
	if ((abs(_angle_diff) < 0.0 or abs(_angle_diff) > 2)) and _sign	== 1 {
		var _turning_direction = sign(_angle_diff)
			
		if _turning_direction > 0 {
			image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
		} else {
			image_angle += 1.0 + 1.0 * abs(speed / 7.0)
		}
	}
	
	if _distance_to_player < 100 and plane_speed > default_speed - 1 {
		plane_speed -= 0.1
	} else if _distance_to_player > 100 and plane_speed < default_speed {
		plane_speed += 0.1	
	}
}

if enemy_state = STATES.DESTROYED {
	
	var _crash_direction = point_direction(x, y, crash_coordinates[0], crash_coordinates[1])
	
	var _angle_diff = angle_difference(image_angle, _crash_direction)
	
	show_debug_message(abs(_angle_diff) % 180)

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
