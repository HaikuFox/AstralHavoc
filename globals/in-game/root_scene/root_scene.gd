class_name RootScene
extends Node

func _ready() -> void:
	SceneLoader.new("res://components/ui/splash_screen/splash_screen.tscn", null, self)
