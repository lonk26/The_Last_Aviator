// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_bullet(_x, _y, _image_angle, _sign, _team, _damage){
	var _bullet = instance_create_layer(_x, _y, "Instances", obj_bullet)
	var _direction_x = lengthdir_x(1, _image_angle)
	var _direction_y = lengthdir_y(1, _image_angle)
	
	_bullet.direction = point_direction(0, 0, _direction_x, _direction_y)
	
	_bullet.speed = 20 * _sign
	
	_bullet.image_angle = _image_angle
	
	_bullet.team = _team	
	
	_bullet.damage = _damage
}