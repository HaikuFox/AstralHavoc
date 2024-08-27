extends Node

var scene
var visible: bool = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_debug_ui"):
		if visible == false:
			SceneLoader.new("res://components/debug/debug_ui/debug_ui.tscn")
			visible = true
		else:
			get_tree().root.get_node(^"/root/DebugUI").queue_free()
			visible = false
