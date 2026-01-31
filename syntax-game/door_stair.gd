extends Area2D

@export var balloon_scene: PackedScene
@export var dialogue_resource: DialogueResource

var balloon_instance: CanvasLayer

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		open_dialogue()

func open_dialogue():
	if balloon_instance:
		return

	balloon_instance = balloon_scene.instantiate()
	get_tree().current_scene.add_child(balloon_instance)
	balloon_instance.start(dialogue_resource, "start")

	# connect the responses menu signal
	balloon_instance.responses_menu.response_selected.connect(_on_response_selected)

func _on_response_selected(response):
	if response.text == "Yes":
		get_tree().change_scene_to_file("res://house.tscn")
	# close the balloon for either response
	balloon_instance.queue_free()
	balloon_instance = null
