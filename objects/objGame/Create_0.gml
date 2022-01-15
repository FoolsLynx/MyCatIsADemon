/// @description Setup Game Managers

#macro	DEVELOPER_MODE			true
#macro	VERSION_NUMBER			"0.0.0.1"

display_manager = new DisplayManager();
input_manager = new InputManager();
audio_manager = new AudioManager();
config_manager = new ConfigManager();


display_manager.create();
input_manager.create();
audio_manager.create();

config_manager.create();