extends Label


func _ready() -> void:
	text = "Graphic Driver: "
	for info: String in OS.get_video_adapter_driver_info():
		text += str(info)
