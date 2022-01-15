function AudioManager() constructor {
	
	static create = function() {
		master_volume	= AUDIO_DEFAULT_MASTER_VOLUME;
		music_volume	= AUDIO_DEFAULT_MUSIC_VOLUME;
		sound_volume	= AUDIO_DEFAULT_SOUND_VOLUME;
		amb_volume		= AUDIO_DEFAULT_AMB_VOLUME;
		voice_volume	= AUDIO_DEFAULT_VOICE_VOLUME;
		
		audio_group_load(agMusic);
		audio_group_load(agSound);
		audio_group_load(agAmb);
		audio_group_load(agVoice);
		
		agMusic_loaded = false;
		agSound_loaded = false;
		agAmb_loaded = false;
		agVoice_loaded = false;
	}
	
	
	static setMasterVolume	= function(_vol) { master_volume = clamp01(_vol); }
	static setMusicVolume	= function(_vol) { music_volume = clamp01(_vol); }
	static setSoundVolume	= function(_vol) { sound_volume = clamp01(_vol); }
	static setAmbVolume		= function(_vol) { amb_volume = clamp01(_vol); }
	static setVoiceVolume	= function(_vol) { voice_volume = clamp01(_vol); }
	
	static getMusicVolume	= function() { return clamp01(master_volume / music_volume); }
	static getSoundVolume	= function() { return clamp01(master_volume / sound_volume); }
	static getAmbVolume		= function() { return clamp01(master_volume / amb_volume); }
	static getVoiceVolume	= function() { return clamp01(master_volume / voice_volume); }
	
	static asyncSaveLoad	= function() {
		if(!agMusic_loaded && audio_group_is_loaded(agMusic)) agMusic_loaded = true;
		if(!agSound_loaded && audio_group_is_loaded(agSound)) agSound_loaded = true;
		if(!agAmb_loaded && audio_group_is_loaded(agAmb)) agAmb_loaded = true;
		if(!agVoice_loaded && audio_group_is_loaded(agVoice)) agVoice_loaded = true;
		
		changeVolume();
	}
	
	static changeVolume		= function() {
		if(agMusic_loaded) audio_group_set_gain(agMusic, getMusicVolume(), 0);
		if(agSound_loaded) audio_group_set_gain(agSound, getSoundVolume(), 0);
		if(agAmb_loaded) audio_group_set_gain(agAmb, getAmbVolume(), 0);
		if(agVoice_loaded) audio_group_set_gain(agVoice, getVoiceVolume(), 0);
	}
}


#macro	AUDIO_DEFAULT_MASTER_VOLUME	1.0
#macro	AUDIO_DEFAULT_MUSIC_VOLUME	0.6
#macro	AUDIO_DEFAULT_SOUND_VOLUME	0.8
#macro	AUDIO_DEFAULT_AMB_VOLUME	0.6
#macro	AUDIO_DEFAULT_VOICE_VOLUME	1.0

#macro	AUDIO_MANAGER				objGame.audio_manager