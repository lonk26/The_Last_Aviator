// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_particle(_x, _y, _type){
	var _particle
	switch _type {
		case "small_exp":
			_particle = instance_create_layer(_x, _y, "Instances_Particles", obj_explosion)
			_particle.sprite_index = spr_explosion
			break
				
		case "large_exp":
			_particle = instance_create_layer(_x, _y, "Instances_Particles", obj_explosion)
			_particle.sprite_index = spr_explosion_bomber
			break
			
		case "aircraft":
			_particle = instance_create_layer(_x, _y, "Instances_Particles", obj_explosion_killed)
			break
			
		case "smoke":
			_particle = instance_create_layer(_x, _y, "Instances_Particles", obj_particles_smoke)
			break
	}
}