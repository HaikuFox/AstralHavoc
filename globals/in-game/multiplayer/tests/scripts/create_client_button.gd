extends Button


func _on_pressed() -> void:
	MultiplayerClient.new()
	$"../TypeLabel".text = "Client"
	SceneLoader.new("res://components/ui/lobby/multiplayer_lobby.tscn", owner)
