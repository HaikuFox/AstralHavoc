class_name State
extends Node

var root_state: RootState


func _init(_root_state: RootState) -> void:
	
	root_state = _root_state
	root_state.add_child(self)


func _enter_state() -> void:
	print("Entered")


func _update(delta: float) -> void:
	for condition: Condition in get_children():
		condition._check_condition(delta)


func _exit_state() -> void:
	print("Exited")
	queue_free()
