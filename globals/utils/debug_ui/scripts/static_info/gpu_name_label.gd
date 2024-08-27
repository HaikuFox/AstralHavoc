extends Label


func _ready() -> void:
	text = "GPU: " + (RenderingServer.get_video_adapter_vendor() +
	": " + RenderingServer.get_video_adapter_name())
