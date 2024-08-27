class_name MultiplayerServer
## Server creation on ENet multiplayer
extends Node

const port: int = 8932
const MAX_CLIENTS: int = 4
var peer: ENetMultiplayerPeer


func _init() -> void:
	name = "ServerPlayer"
	call_deferred("add_to_tree")


func add_to_tree() -> void:
	Engine.get_main_loop().root.add_child(self)


func _enter_tree() -> void:
	multiplayer.peer_connected.connect(
		func _new_client_connected(id: int) -> void:
			MultiplayerLogger.info(self, "New client " + str(id) + " connected"))

	multiplayer.peer_disconnected.connect(
		func _client_disconnected(id: int) -> void:
			MultiplayerLogger.info(self, "Client " + str(id) + " disconnected"))

	peer = ENetMultiplayerPeer.new()
	var error: Error = peer.create_server(port, MAX_CLIENTS)
	if error:
		MultiplayerLogger.err(self, str(error))
		return
	multiplayer.multiplayer_peer = peer
	MultiplayerLogger.info(self, "Server " + "created on " + str(port))
