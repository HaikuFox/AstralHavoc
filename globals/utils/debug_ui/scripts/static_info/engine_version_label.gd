extends Label


func _ready() -> void:
	text = ("Engine: " + "Godot Engine v" +
			Engine.get_version_info().string)
