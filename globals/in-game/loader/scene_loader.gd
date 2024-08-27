class_name SceneLoader
extends Node


var loaded_scene: Node
var destination: Node
var scene_path: String
var progress: Array
var update_timer: Timer = Timer.new()


func _init(_scene_path: String, current_scene: Node,
_destination: Node) -> void:

	if not ResourceLoader.exists(_scene_path):
		err(self, "Invalid scene path " + _scene_path)
		return

	scene_path = _scene_path
	if _destination:
		destination = _destination
	else:
		if Engine.get_main_loop().root:
			destination = Engine.get_main_loop().root

	var error : Error = ResourceLoader.load_threaded_request(_scene_path, "", true)
	assert(error == OK)
	call_deferred("setup_timer")

	if current_scene:
		current_scene.queue_free()


func setup_timer() -> void:
	if Engine.get_main_loop().root:
		Engine.get_main_loop().root.add_child(update_timer)
	update_timer.one_shot = false
	update_timer.autostart = true
	update_timer.set_wait_time(0.01)
	var _err : int = update_timer.timeout.connect(_check_status)
	update_timer.start()


func _check_status() -> Node:
	var status : int = ResourceLoader.load_threaded_get_status(scene_path, progress)
	if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		return null
	elif status == ResourceLoader.THREAD_LOAD_LOADED:
		var scene : Resource = ResourceLoader.load_threaded_get(scene_path)
		loaded_scene = scene.instantiate()
		destination.add_child(loaded_scene)
		update_timer.queue_free()
		queue_free()
		return loaded_scene
	elif status == ResourceLoader.THREAD_LOAD_FAILED:
		err(self, "Loading " + scene_path + " failed")
		return null
	elif status == ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
		err(self, "Resource " + scene_path + " is invalid")
		return null
	else:
		return null

func err(node: Node, msg: String) -> void:
	printerr(node.name, ": ", msg)
