extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	
	# Create client.
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("10.111.126.47", 5504)
	multiplayer.multiplayer_peer = peer

	# Create server.
	


func _on_host_pressed() -> void:
	var host = ENetMultiplayerPeer.new()
	host.create_server(5504, 5)
	multiplayer.multiplayer_peer = host


func _on_join_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("10.111.126.47", 5504)
	multiplayer.multiplayer_peer = peer




func _on_send_pressed() -> void:
	sync_text(get_node("Control/VBoxContainer/TextEdit").text)
	
@rpc
func sync_text(text):
	get_node("Control/VBoxContainer/TextEdit").text = text
