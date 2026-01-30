extends Node2D

@onready var textbox = $window/CanvasLayer/Panel

var hand_cursor = preload("res://Player/Sprites/hand.png")

func _ready():
	pass

func _process(delta):
	pass

func change_cursor_hand():
	Input.set_custom_mouse_cursor(hand_cursor)
	pass

func change_cursor_back():
	Input.set_custom_mouse_cursor(null)

func _unhandled_input(event):
	if textbox.visible and event is InputEventMouseButton and event.pressed:
		await get_tree().process_frame
		textbox.visible = false
