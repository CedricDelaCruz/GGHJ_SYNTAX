extends Node2D

@onready var textbox = $window/CanvasLayer/Panel
@onready var animation_player: AnimationPlayer = $windowpane/AnimationPlayer

var hand_cursor = preload("res://Player/Sprites/hand.png")

func _ready():
	animation_player.play("sway")
	animation_player.play("look")

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
		
func play_animation() -> void:
	animation_player.play("look")
