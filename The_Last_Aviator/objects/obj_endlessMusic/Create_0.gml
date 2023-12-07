audio_stop_sound(snd_menuMusic)
audio_play_sound(snd_endlessMusic,2,true)
if(game_restart){
	audio_stop_sound(snd_deathMusic)
	audio_stop_sound(snd_endlessMusic)
	audio_play_sound(snd_endlessMusic,2,true)
}