extends Node


func _ready() -> void:
	var root_state: RootState = RootState.new()
	var state1: State = State.new(root_state)
	state1._enter_state()
	var state2: State = State.new(root_state)
	var condition: Condition = Condition.new(state1, false, state2)
	
	await get_tree().create_timer(10).timeout
	condition.force_switch()
