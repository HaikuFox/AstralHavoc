extends Node

func _ready() -> void:
	if get_tree().current_scene is RootScene:
		print("Root scene: Get scene test passed")
		await get_tree().create_timer(0.2).timeout
		get_tree().quit(0)
	else:
		print("Root scene: Get scene test failed")
		await get_tree().create_timer(0.2).timeout
		get_tree().quit(0)
