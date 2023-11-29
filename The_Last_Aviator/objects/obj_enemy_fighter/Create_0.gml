/// Establishing necessary entity variables

/// Enemies use a State system to determine behavior
enum STATES {
	REGULAR = 0,
	CHASING = 1,
	DESTROYED = 2
}

/// Default state is regular (moving left to right)
enemy_state = STATES.REGULAR

/// Crash coordinates are set when enemy is destroyed, for creation they will be empty
crash_coordinates = noone

/// Setting the plane speed to the default_speed class variable
plane_speed = default_speed

/// Setting the pl
health = enemy_health

image_xscale *= -1