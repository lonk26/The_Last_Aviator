/// Bullet creation code

var _direction_y = lengthdir_y(1, obj_player.image_angle)
var _direction_x = lengthdir_x(1, obj_player.image_angle)

speed = 20 * sign(obj_player.speed)
direction = point_direction(0,0, _direction_x, _direction_y)
image_angle = obj_player.image_angle
 