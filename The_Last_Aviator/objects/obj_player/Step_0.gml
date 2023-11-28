/// @description Insert description here
// You can write your code in this editor


var _direction_y = lengthdir_y(1, image_angle)
var _direction_x = lengthdir_x(1, image_angle)

var _sign = sign(image_xscale)

if _direction_y > 0.5 {
	if plane_speed * _sign < (default_speed * _sign + 3) {
		plane_speed += 0.1 * _sign
	}
}

if _direction_y < -0.5 {
	if plane_speed * _sign > (default_speed * _sign - 3) {
		plane_speed -= 0.1 * _sign
	}
}

if _direction_y > -0.5 and _direction_y < 0.5 and plane_speed < default_speed {
	plane_speed += 0.1
}

if _direction_y > -0.5 and _direction_y < 0.5 and plane_speed > default_speed {
	plane_speed -= 0.1
}

direction = point_direction(0,0, _direction_x, _direction_y)

if player_control {
	if (keyboard_check(vk_right)) {
	    image_angle -= 1.0 + 1.0 * abs(speed / 6.0); // Rotate the sprite 5 degrees to the right
	}

	if (keyboard_check(vk_left)) {
	    image_angle += 1.0 + 1.0 * abs(speed / 6.0); // Rotate the sprite 5 degrees to the left
	}
	
	if (keyboard_check(vk_space) and firing_cooldown == false) {
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
		show_debug_message(x + _gun_xoffset)
		show_debug_message(y + _gun_yoffset)
		instance_create_layer(x + _gun_xoffset, y + _gun_yoffset, "Instances", obj_player_bullet)	
		firing_cooldown = true
		alarm[0] = 5
	}
}

if speed < 0 {
	speed = -plane_speed
} else {
	speed = plane_speed
}

if ((x  < -50 or x > room_width + 50) and player_control == true) {
	_direction_x *= -1
	direction =  point_direction(0,0, -_direction_x, _direction_y)
	image_xscale *= -1
	image_yscale *= -1
	speed *= -1
	player_control = false
}

if x > 1 and player_control == false {
	player_control = true	
}
