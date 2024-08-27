extends HBoxContainer

func _on_visibility_changed() -> void:
	if visible:
		process_mode = PROCESS_MODE_ALWAYS
	else:
		process_mode = PROCESS_MODE_DISABLED
