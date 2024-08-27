class_name Condition
extends Node


var curr_state: State
var condition: bool
var next_state: State

func _init(state: State, _condition: bool, _next_state: State) -> void:
	var error: bool = state == _next_state
	if error:
		return
		breakpoint
	curr_state = state
	state.add_child(self)
	condition = _condition
	next_state = _next_state


func force_switch() -> void:
	print("Force switch")
	curr_state._exit_state()
	next_state._enter_state()


func _check_condition(_delta: float) -> void:
	if condition:
		print("Condition success workin'")
		curr_state.queue_free()
		next_state._enter_state()
