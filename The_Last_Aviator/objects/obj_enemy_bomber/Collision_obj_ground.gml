/// @description Insert description here
// You can write your code in this editor

create_particle(x, y, "large_exp")
audio_stop_sound(snd_planeFall)
audio_sound_pitch(snd_explosion, random_range(0.8, 1.2));
audio_play_sound(snd_explosion,1,false)
instance_destroy()
