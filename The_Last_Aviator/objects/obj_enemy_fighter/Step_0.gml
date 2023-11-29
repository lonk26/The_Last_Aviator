/// Enemy plane behavior

var _distance_to_player = distance_to_object(obj_player)

var _direction_y = lengthdir_y(1, image_angle)
var _direction_x = lengthdir_x(1, image_angle)

var _sign = sign(image_xscale)

direction = point_direction(0,0, _direction_x, _direction_y)

var _gravity = 3 * _direction_y

if enemy_state = STATES.REGULAR {
	if _distance_to_player < 300 and chasing_cooldown == false {
		show_debug_message("chasing")
		enemy_state = STATES.CHASING	
	}
	alarm[0] = 180
}


if enemy_state = STATES.CHASING {
	var _direction_to_player = point_direction(x, y, obj_player.x, obj_player.y)
	
	var _angle_diff = angle_difference(image_angle, _direction_to_player)
	
	if abs(_angle_diff) > 1 {
		var _turning_direction = sign(_angle_diff)
		
		if _turning_direction > 0 {
			image_angle += 1.0 + 1.0 * abs(speed / 7.0)
		} else {
			image_angle -= 1.0 + 1.0 * abs(speed / 7.0)
		}
	}
	
	if _distance_to_player < 100 and plane_speed > default_speed - 3 {
		plane_speed -= 0.1
	} else if _distance_to_player > 100 and plane_speed < default_speed {
		plane_speed += 0.1	
	}
}

if _sign == 1 {
	speed = plane_speed + _gravity
} else {
	speed = -plane_speed + _gravity
}

if ((x  < -50 or x > room_width + 50)) {
	_direction_x *= -1
	direction =  point_direction(0,0, -_direction_x, _direction_y)
	image_xscale *= -1
	//image_yscale *= 1
	speed *= -1
}
