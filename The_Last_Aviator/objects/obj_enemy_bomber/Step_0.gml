/// Enemy plane behavior

var _distance_to_player = distance_to_object(obj_player)

var _direction_x = lengthdir_x(1, image_angle)
var _direction_y = lengthdir_y(1, image_angle)

var _sign = sign(image_xscale)

direction = point_direction(0,0, _direction_x, _direction_y)

var _gravity = 3 * _direction_y

if health <= 0 and crash_coordinates == noone {
	crash_coordinates = get_crash_coordinate(x, y, (sign(_direction_x) * _sign))
	bomber_state = STATES.DESTROYED
}

/// ------------------------------ Enemy Fighter State Code --------------------------------------

if bomber_state = STATES.REGULAR {
	
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

if bomber_state = STATES.DESTROYED {
	
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
