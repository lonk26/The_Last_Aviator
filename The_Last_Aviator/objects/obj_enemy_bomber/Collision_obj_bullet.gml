/// @description Insert description here
// You can write your code in this editor

if other.team == "player" {
	
	enemy_health -= other.damage

	instance_destroy(other)

	var _particle_instance = instance_create_layer(x, y, "Instances_Particles", obj_particles_hit)

	_particle_instance.particle_gravity = 2.0

	_particle_instance.particle_lifespan = 15

	if bomber_state == STATES.DESTROYED {
		score += 15	
	} else {
		score += 30
	}
} else {
	
}
