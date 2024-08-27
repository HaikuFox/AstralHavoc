class_name RootState
extends Node


var states: Array[State]

func _init() -> void:
	call_deferred("add_to_tree")

func add_to_tree() -> void:
	Engine.get_main_loop().root.add_child(self)

func _process(delta: float) -> void:
	for state: State in get_children():
		state._update(delta)
