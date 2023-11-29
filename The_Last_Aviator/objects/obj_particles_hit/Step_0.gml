/// @description Insert description here
// You can write your code in this editor

if (particle_lifespan > 0) {
	y += particle_gravity
	
	particle_lifespan--
} else {
	instance_destroy()	
}

draw_sprite(spr_debris, 0, x, y)