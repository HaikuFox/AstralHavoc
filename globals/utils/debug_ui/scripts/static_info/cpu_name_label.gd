extends Label


func _ready() -> void:
	text = "CPU: " + (str(OS.get_processor_count()) +
	"x " + OS.get_processor_name())
