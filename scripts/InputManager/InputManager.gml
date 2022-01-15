function InputManager() constructor {
	static create = function() {
		createKeyboard();
		createGamepad();
		
		input_bindings = input_bindings_write();
		
		input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
	}
	
	static createKeyboard = function() {
		input_default_key(vk_left, "left");
		input_default_key(vk_right, "right");
		input_default_key(vk_up, "up");
		input_default_key(vk_down, "down");
		
		input_default_key(vk_space, "action");
		input_default_key(ord("X"), "cancel");
		input_default_key(vk_tab, "menu");
		
	}
	
	static createGamepad = function() {
		input_default_gamepad_axis(gp_axislh, true, "left");
		input_default_gamepad_axis(gp_axislh, false, "right");
		input_default_gamepad_axis(gp_axislv, true, "up");
		input_default_gamepad_axis(gp_axislv, false, "down");
		
		input_default_gamepad_button(gp_padl, "left", 1);
		input_default_gamepad_button(gp_padr, "right", 1);
		input_default_gamepad_button(gp_padu, "up", 1);
		input_default_gamepad_button(gp_padd, "down", 1);
		
		input_default_gamepad_button(gp_face1, "action");
		input_default_gamepad_button(gp_face2, "cancel");
		input_default_gamepad_button(gp_face3, "menu");
	}
	
	static beginStep = function() {
		input_tick();	
	}
	
	static setInputBindings = function(_bindings) {
		input_bindings_read(_bindings);
		input_bindings = input_bindings_write();
	}
}


#macro	INPUT_MANAGER		objGame.input_manager