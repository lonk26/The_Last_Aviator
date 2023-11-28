/// Enemy plane behavior

var _distance_to_player = distance_to_object(obj_player)

var _direction_y = lengthdir_y(1, image_angle)
var _direction_x = lengthdir_x(1, image_angle)

var _sign = sign(image_xscale)

if enemy_state = STATES.REGULAR {
	
}

if enemy_state = STATES.CHASING {
	direction = point_direction(x, y, obj_player.x, obj_player.y)
	
	if _distance_to_player < 100 {
		plane_speed -= 0.1	
	}
}

if _sign == -1 {
	speed = -plane_speed
} else {
	speed = plane_speed
}

if ((x  < -50 or x > room_width + 50)) {
	_direction_x *= -1
	direction =  point_direction(0,0, -_direction_x, _direction_y)
	image_xscale *= -1
	//image_yscale *= 1
	speed *= -1
}
