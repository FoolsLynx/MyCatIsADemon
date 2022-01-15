/// @param struct
/// @param key
/// @param value
function struct_set(_struct, _key, _value = undefined) { variable_struct_set(_struct, _key, _value); }

/// @param struct
/// @param key
/// @param default
function struct_get(_struct, _key, _default = undefined) { return struct_exists(_struct, _key) ? variable_struct_get(_struct, _key) : _default; }

/// @param struct
/// @param key
function struct_exists(_struct, _key) { return variable_struct_exists(_struct, _key); }

/// @param struct
/// @param key
/// @param value
/// @param replace
function struct_add(_struct, _key, _value = undefined, _replace = false) {
	if(_replace) struct_set(_struct, _key, _value);
	else if(!struct_exists(_struct, _key)) struct_set(_struct, _key, _value);
}

