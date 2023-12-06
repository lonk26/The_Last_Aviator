/// If the fighter is not destroyed, reset it's state to regular and run it's chase cooldown

if fighter_state != STATES.DESTROYED {
	fighter_state = STATES.REGULAR
	chasing_cooldown = true
	alarm[1] = random_range(120, 210)
}