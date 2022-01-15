function DisplayManager() constructor {
	
	static create = function() {
		scale		= DISPLAY_DEFAULT_SCALE;
		fullscreen	= DISPLAY_DEFAULT_FULLSCREEN;
		resize();
	}
	
	static scaleUp = function() {
		var _scale = scale;
		if(_scale > getMaxScale()) _scale = 1;	
		setScale(_scale);		
	}
	
	static scaleDown = function() {
		var _scale = scale;
		if(_scale <= 0) _scale = getMaxScale();
		setScale(_scale);
	}
	
	static setScale = function(_scale) {
		scale = clamp(_scale, 1, getMaxScale());
		resize();
	}
	
	static setFullscreen = function(_fullscreen) {
		fullscreen = _fullscreen;
		resize();
	}
	
	static resize = function() {
		window_set_fullscreen(fullscreen);
		if(!fullscreen) {
			window_set_size(getWidthScale(), getHeightScale());
			surface_resize(application_surface, getWidthScale(), getHeightScale());
		}
		display_set_gui_size(DISPLAY_WIDTH, DISPLAY_HEIGHT);
	}
	
	static getWidthScale = function() { return DISPLAY_WIDTH * scale; }
	static getHeightScale = function() { return DISPLAY_HEIGHT * scale; }
	
	static getMaxScale = function() {
		return floor(min(display_get_width() / DISPLAY_WIDTH, display_get_height() / DISPLAY_HEIGHT));
	}
}

#macro	DISPLAY_WIDTH				384
#macro	DISPLAY_HEIGHT				216

#macro	DISPLAY_DEFAULT_SCALE		2
#macro	DISPLAY_DEFAULT_FULLSCREEN	false

#macro	DISPLAY_MANAGER				objGame.display_manager