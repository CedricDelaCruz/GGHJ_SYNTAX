extends Node

const PLAYER = preload("uid://b6l0x2dykp2o5")

var player : Player

func _ready() -> void:
	add_player_instance()



func add_player_instance() -> void:
	player = PLAYER.instantiate()
	add_child( player )
	pass
