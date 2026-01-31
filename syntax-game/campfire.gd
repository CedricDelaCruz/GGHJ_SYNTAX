extends Area2D

@onready var player: Player = $"../Player"

@onready var troll: Sprite2D = $troll
@export var balloon_scene: PackedScene
@export var dialogue_resource: DialogueResource

var balloon_instance: CanvasLayer
var wait_for_dismiss: bool = false  # tracks if next click anywhere hides troll


# Detect clicks **on the door** to open dialogue
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if not wait_for_dismiss and not balloon_instance:
			open_dialogue()


# Detect **any click anywhere** to hide the troll
func _unhandled_input(event):
	if wait_for_dismiss and event is InputEventMouseButton and event.pressed:
		hide_troll()


func open_dialogue():
	if balloon_instance:
		return

	# Instantiate balloon
	balloon_instance = balloon_scene.instantiate()
	get_tree().current_scene.add_child(balloon_instance)

	# Start the dialogue
	balloon_instance.start(dialogue_resource, "start")

	# Connect the responses menu signal
	balloon_instance.responses_menu.response_selected.connect(_on_response_selected)


func _on_response_selected(response):
	if response.text == "Yes":
		show_troll()
	elif response.text == "No":
		pass

	# Close balloon for either response
	balloon_instance.queue_free()
	balloon_instance = null


func show_troll():
	troll.visible = true
	wait_for_dismiss = true  # next click anywhere will hide it
	
	if is_instance_valid(player):
		player.visible = false


func hide_troll():
	troll.visible = false
	wait_for_dismiss = false
	
	if is_instance_valid(player):
		player.visible = true
