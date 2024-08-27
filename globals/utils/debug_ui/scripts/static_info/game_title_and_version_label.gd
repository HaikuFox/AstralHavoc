extends Label


func _ready() -> void:
	text = (ProjectSettings.get_setting("application/config/name") +
			" v" + ProjectSettings.get_setting("application/config/version"))
