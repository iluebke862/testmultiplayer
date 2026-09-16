extends Node2D




func _on_host_pressed() -> void:
	var host = ENetMultiplayerPeer.new()
	host.create_server(5504, 5)
	multiplayer.multiplayer_peer = host


func _on_join_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	print(peer.create_client("10.111.128.47", 5504))
	#OS.execute("ipconfig", ["getifaddr", "en0"], output) OS.get_name
	var os=OS.get_name()
	
	
	if os=="Mac":
		var ipe=OS.execute("ipconfig",["getifaddr","en0"])
		peer.create_client(ipe,5504)
	else:
		var ipw=OS.execute_with_pipe("cmd.exe",["/c","ipconfig"])
		print(ipw)

	multiplayer.multiplayer_peer = peer




func _on_send_pressed() -> void:
	if multiplayer.multiplayer_peer == null:
		print("No multiplayer peer")
		return
	if multiplayer.multiplayer_peer.get_connection_status() != MultiplayerPeer.CONNECTION_CONNECTED:
		print("Not connected yet")
		return
	sync_text.rpc(get_node("Control/VBoxContainer/TextEdit").text)
	
@rpc
func sync_text(text):
	print("hi")
	get_node("Control/VBoxContainer/TextEdit").text = text
