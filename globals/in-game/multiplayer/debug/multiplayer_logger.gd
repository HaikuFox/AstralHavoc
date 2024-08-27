class_name MultiplayerLogger
extends Node


static func info(node: Node, text: String) -> void:
	print_rich("[color=green]", _log(node, text, " [NETWORK INFO] "))


static func err(node: Node, text: String) -> void:
	print_rich("[color=red]", _log(node, text, " [NETWORK ERROR] "))


static func _log(node: Node, text: String, type: String) -> String:
	text = str(Time.get_time_string_from_system(),
			type + str(node.name) + ": ", text)
	return text
