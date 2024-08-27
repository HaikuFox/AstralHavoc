extends Button


func _on_pressed() -> void:
	SceneLoader.new("res://components/ui/connection_type_pop_up/connection_type_pop_up.tscn", null, self)
