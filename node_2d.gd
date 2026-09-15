extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_tree().get_multiplayer())
	
	
	
	# Create client.
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("10.111.126.47", 5504)
	multiplayer.multiplayer_peer = peer

	# Create server.
	var server = ENetMultiplayerPeer.new()
	server.create_server(200, 5)
	multiplayer.multiplayer_peer = peer
