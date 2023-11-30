/// Taking damage from the player

if other.team == "player" {
	
	enemy_health -= 100

	instance_destroy(other)

	var _particle_instance = instance_create_layer(x, y, "Instances_Particles", obj_particles_hit)

	_particle_instance.particle_gravity = 2.0

	_particle_instance.particle_lifespan = 15
	
} else {
	
}