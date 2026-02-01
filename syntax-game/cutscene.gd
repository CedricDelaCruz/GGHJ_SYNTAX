extends BaseDialogueTestScene

@export var phone_dialogue: DialogueResource
@export var start_title: String = "start"

func _ready() -> void:
	var balloon = load("res://dialogue_balloon/balloon.tscn").instantiate()
	get_tree().current_scene.add_child(balloon)

	# connect to the "finished" signal
	balloon.dialogue_finished.connect(_on_dialogue_finished)

	# START PHONE DIALOGUE (not door.dialogue)
	balloon.start(phone_dialogue, start_title)


func _on_dialogue_finished():
	LevelTransition.change_scene_to_file("res://playground.tscn")
