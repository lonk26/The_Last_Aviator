/// @description Insert description here
// You can write your code in this editor

/// Enemies use a State system to determine behavior
enum STATES {
	REGULAR = 0,
	CHASING = 1,
	DESTROYED = 2
}

score = 0

_GUI_text = ds_list_create()
ds_list_add(_GUI_text, "")