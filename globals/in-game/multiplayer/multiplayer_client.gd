class_name MultiplayerClient
## Client creation on ENet multiplayer
extends Node

const  port: int = 8932
var peer: ENetMultiplayerPeer
var server_address: String


func _init(_server_address: String = "127.0.0.1") -> void:
	name = "ClientPlayer"

	if server_address == null or server_address.is_empty():
		server_address = "127.0.0.1"
	else:
		server_address = _server_address

	call_deferred("add_to_tree")


func add_to_tree() -> void:
	Engine.get_main_loop().root.add_child(self)


func _enter_tree() -> void:
	multiplayer.connected_to_server.connect(
		func _connected_to_server() -> void:
			MultiplayerLogger.info(self, "Client " + "connected to " +
				server_address + ":" + str(port)))
	multiplayer.peer_connected.connect(
		func _new_client_connected(id: int) -> void:
			if id == 1:
				return
			MultiplayerLogger.info(self, "Notified " + " new client " +
					str(id)+ " connected to " +
					server_address + ":" + str(port)))
	multiplayer.peer_disconnected.connect(
		func _client_disconnected(id: int) -> void:
			if id == 1:
				return
			MultiplayerLogger.info(self, "Client " + str(id) + " disconnected"))
	multiplayer.server_disconnected.connect(
		func _server_disconnected() -> void:
			MultiplayerLogger.info(self, "Server is disconnected, returning to menu...")
			multiplayer.multiplayer_peer = null)

	peer = ENetMultiplayerPeer.new()
	var error: Error = peer.create_client(server_address, port)
	if error:
		MultiplayerLogger.err(self, str(error))
		return
	multiplayer.multiplayer_peer = peer
