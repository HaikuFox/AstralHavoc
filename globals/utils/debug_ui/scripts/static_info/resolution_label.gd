extends Label


func _ready() -> void:
	get_tree().get_root().size_changed.connect(update_text)
	text = "Resolution: " + str(DisplayServer.window_get_size())


func update_text() -> void:
	text = "Resolution: " + str(DisplayServer.window_get_size())
