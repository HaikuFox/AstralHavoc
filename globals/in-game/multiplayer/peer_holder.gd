extends Node


var peers: Array[int] = []


func _ready() -> void:
	multiplayer.peer_connected.connect(_add_peer)
	multiplayer.peer_disconnected.connect(_delete_peer)
	multiplayer.server_disconnected.connect(_clear)


func _add_peer(id: int) -> void:
	peers.append(id)


func _delete_peer(id: int) -> void:
	peers.erase(id)


func _clear() -> void:
	peers.clear()
