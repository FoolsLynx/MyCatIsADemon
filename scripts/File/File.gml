/// @params filename
function file_read_all(_filename) {
	try {
		var _string = "";
		var _file = file_text_open_read(_filename);
		while(!file_text_eof(_file)) {
			_string += file_text_read_string(_file);
			file_text_readln(_file);
		}
		file_text_close(_file);
		return _string;
	} catch(e) {
		show_debug_message(e.longMessage);
		return undefined;	
	} 
}

/// @params filename
/// @params [content,...]
function file_write_all(_filename) {
	try {
		if(file_exists(_filename)) file_delete(_filename);
		var _file = file_text_open_write(_filename);	
		for(var i = 1; i < argument_count; i++) {
			file_text_write_string(_file, argument_count[i]);
		}
		file_text_close(_file);
	} catch(e) {
		show_debug_message(e.longMessage);	
	}
}