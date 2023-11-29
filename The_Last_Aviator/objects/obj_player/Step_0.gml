/// Player aircraft movement behavior


var _direction_y = lengthdir_y(1, image_angle)
var _direction_x = lengthdir_x(1, image_angle) // -1 to 1 (will flip signs when plane hits a wall

var _sign = sign(image_xscale)

var _gravity = 3 * _direction_y

direction = point_direction(0,0, _direction_x, _direction_y)

if player_control {
	if (keyboard_check(vk_right)) {
	    image_angle -= 1.0 + 1.0 * abs(speed / 7.0); // Rotate the sprite 5 degrees to the right
	}

	if (keyboard_check(vk_left)) {
	    image_angle += 1.0 + 1.0 * abs(speed / 7.0); // Rotate the sprite 5 degrees to the left
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
		alarm[0] = 10
	}
	
	if (keyboard_check(vk_up) and throttle < 1) {
		throttle += 0.01	
	}
	
	if (keyboard_check(vk_down) and throttle > 0) {
		throttle -= 0.01
	}
}

if speed < 0 {
	speed = -plane_speed + _gravity + (throttle * 3)
} else {
	speed = plane_speed + _gravity + (throttle * 3)
}

if ((x  < -100 or x > room_width + 100) and player_control == true) {
	_direction_x *= -1
	direction =  point_direction(0,0, -_direction_x, _direction_y)
	image_xscale *= -1
	image_yscale *= -1
	speed *= -1
	player_control = false
}

/// --------------------- Forcing aircraft back within game world -----------------------------

if (y < -100) and player_control == true { 
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
	player_control = false
}

if (x > 1 and y > 0) and player_control == false {
	player_control = true	
}
