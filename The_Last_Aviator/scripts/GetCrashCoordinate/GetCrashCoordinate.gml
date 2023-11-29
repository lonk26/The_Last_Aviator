// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_crash_coordinate(_x, _y, _facing) {
	var _crash_x = 0
	var _crash_y = 1400
	var _curr_height = 1400 - _y
	if _facing == 1 {
		_crash_x = _x + (_curr_height / 2)
	} else {
		_crash_x = _x - (_curr_height / 2)
	}
	return [_crash_x, _crash_y]
}