// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ConfigManager() constructor {
	static create = function() {
		config = {};	
		// General
		struct_set(config, "version", VERSION_NUMBER);
		
		// Display
		struct_set(config, "dScale", DISPLAY_DEFAULT_SCALE);
		struct_set(config, "dFullscreen", DISPLAY_DEFAULT_FULLSCREEN);
		
		// Audio
		struct_set(config, "aMaster", AUDIO_DEFAULT_MASTER_VOLUME);
		struct_set(config, "aMusic", AUDIO_DEFAULT_MUSIC_VOLUME);
		struct_set(config, "aSound", AUDIO_DEFAULT_SOUND_VOLUME);
		struct_set(config, "aAmb", AUDIO_DEFAULT_AMB_VOLUME);
		struct_set(config, "aVoice", AUDIO_DEFAULT_VOICE_VOLUME);
		
		// Input
		struct_set(config, "iBindings", input_bindings_write());
		
		// Save Load
		if(DEVELOPER_MODE) {
			if(debug_mode) saveConfig(); 
			else if(file_exists(CONFIG_PATH)) loadConfig();
			else saveConfig();
		} else {
			if(file_exists(CONFIG_PATH)) loadConfig();	
			else saveConfig();	
		}
	}
	
	static saveConfig = function() {
		json_save(CONFIG_PATH, config);
	}
	
	static loadConfig = function() {
		var _data = json_load(CONFIG_PATH);
		if(_data != undefined) {
			config = _data;	
			if(struct_get(config, "version") != undefined && struct_get(config, "version") != VERSION_NUMBER) {
				updateVersion();	
			}
			// Display
			DISPLAY_MANAGER.setScale(struct_get(config, "dScale", DISPLAY_DEFAULT_SCALE));
			DISPLAY_MANAGER.setFullscreen(struct_get(config, "dFullscreen", DISPLAY_DEFAULT_FULLSCREEN));
			// Audio
			AUDIO_MANAGER.setMasterVolume(struct_get(config, "aMaster", AUDIO_DEFAULT_MASTER_VOLUME));
			AUDIO_MANAGER.setMusicVolume(struct_get(config, "aMusic", AUDIO_DEFAULT_MUSIC_VOLUME));
			AUDIO_MANAGER.setSoundVolume(struct_get(config, "aSound", AUDIO_DEFAULT_SOUND_VOLUME));
			AUDIO_MANAGER.setAmbVolume(struct_get(config, "aAmb", AUDIO_DEFAULT_AMB_VOLUME));
			AUDIO_MANAGER.setVoiceVolume(struct_get(config, "aVoice", AUDIO_DEFAULT_VOICE_VOLUME));
			AUDIO_MANAGER.changeVolume();
			// Input
			INPUT_MANAGER.setInputBindings(struct_get(config, "iBindings", input_bindings_write()));
		}
	}
	
	static updateVersion = function() {
		// Set New Version Number
		struct_set(config, "version", VERSION_NUMBER);
		// Set General Variables that are Missing
		
		// Set Display Variables that are Missing
		struct_add(config, "dScale", DISPLAY_DEFAULT_SCALE);
		struct_add(config, "dFullscreen", DISPLAY_DEFAULT_FULLSCREEN);
		// Set Audio Variables that are Missing
		struct_add(config, "aMaster", AUDIO_DEFAULT_MASTER_VOLUME);
		struct_add(config, "aMusic", AUDIO_DEFAULT_MUSIC_VOLUME);
		struct_add(config, "aSound", AUDIO_DEFAULT_SOUND_VOLUME);
		struct_add(config, "aAmb", AUDIO_DEFAULT_AMB_VOLUME);
		struct_add(config, "aVoice", AUDIO_DEFAULT_VOICE_VOLUME);
		// Set Input Variables that are Missing
		struct_add(config, "iBindings", input_bindings_write());
		// Save the Config
		saveConfig();
	}
	
	
}


#macro	CONFIG_PATH					working_directory + "Config.dat"

#macro	CONFIG_MANAGER				objGame.config_manager