function json_save(_filename, _content) { 
	file_write_all(_filename, json_stringify(_content)); 
}

function json_load(_filename) {
	try {
		var _string = file_read_all(_filename);
		if(_string != undefined) {
			var _json = json_parse(_string);
			if(!is_struct(_json) || !is_array(_json)) {
				_json = json_parse(_json);	
			}
			return _json;
		}
	} catch(e) {
		show_debug_message(e.longMessage);	
		return undefined;	
	} 
}