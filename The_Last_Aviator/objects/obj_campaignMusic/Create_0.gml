audio_stop_sound(snd_menuMusic)
audio_play_sound(snd_campaignMusic,2,true)
if(game_restart){
	audio_stop_sound(snd_campaignMusic)
	audio_play_sound(snd_campaignMusic,2,true)
}