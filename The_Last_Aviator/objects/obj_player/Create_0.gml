/// Sets the plane speed to the class variable default_speed

plane_speed = default_speed

player_crash_coordinates = noone

create_smoke = true

audio_play_sound(snd_planeEngine,1,true)
if(game_restart){
	audio_stop_sound(snd_planeEngine)
	audio_play_sound(snd_planeEngine,1,true)
}