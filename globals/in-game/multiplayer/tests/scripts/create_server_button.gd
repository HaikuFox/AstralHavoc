extends Button


func _on_pressed() -> void:
	MultiplayerServer.new()
	$"../TypeLabel".text = "Server"
	SceneLoader.new("res://components/ui/lobby/multiplayer_lobby.tscn", owner)
