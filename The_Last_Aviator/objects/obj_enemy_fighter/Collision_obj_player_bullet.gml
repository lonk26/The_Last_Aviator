/// Taking damage from the player

health -= 5

instance_destroy(other)

var _particle_instance = instance_create_layer(x, y, "Instances_Particles", obj_particles_hit)

_particle_instance.particle_gravity = 2.0

_particle_instance.particle_lifespan = 15