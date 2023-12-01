// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_explosion(_x, _y, _type){
	var _explosion
	switch _type {
		case "small":
			_explosion = instance_create_layer(_x, _y, "Instances_Particles", obj_explosion)
			_explosion.sprite_index = spr_explosion
			break
				
		case "large":
			_explosion = instance_create_layer(_x, _y, "Instances_Particles", obj_explosion)
			_explosion.sprite_index = spr_explosion_bomber
			break
		
	}
}