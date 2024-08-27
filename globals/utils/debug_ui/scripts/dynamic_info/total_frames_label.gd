extends Label


func _process(_delta: float) -> void:
	text ="Total frames: " + str(Engine.get_frames_drawn())
