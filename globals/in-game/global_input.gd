extends Node


func _init() -> void:
	RenderingServer.set_debug_generate_wireframes(true)


func _input(_event: InputEvent) -> void:
	toggle_fullscreen_input()
	debug_mode_toggle()
	show_mouse()


func show_mouse() -> void:
	if Input.is_action_just_pressed("show_mouse"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func debug_mode_toggle() -> void:
	if Input.is_action_just_pressed("debug_draw"):
		var vp: Window = get_viewport()
		vp.debug_draw = (vp.debug_draw + 1 ) % 5


func toggle_fullscreen_input() -> void:
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
