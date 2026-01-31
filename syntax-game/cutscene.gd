extends BaseDialogueTestScene

func _ready() -> void:
	var balloon = load("res://dialogue_balloon/balloon.tscn").instantiate()
	get_tree().current_scene.add_child(balloon)

	# connect to the "finished" signal
	balloon.dialogue_finished.connect(_on_dialogue_finished)

	balloon.start(resource, title)


func _on_dialogue_finished():
	get_tree().change_scene_to_file("res://playground.tscn")
