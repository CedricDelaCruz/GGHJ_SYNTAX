extends Area2D

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

@export var balloon_scene: PackedScene
@export var dialogue_resource: DialogueResource

var balloon_instance: CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func play_animation() -> void:
	animation_player.play("look")
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		open_dialogue()

func open_dialogue():
	if balloon_instance:
		return

	balloon_instance = balloon_scene.instantiate()
	get_tree().current_scene.add_child(balloon_instance)
	balloon_instance.start(dialogue_resource, "start")
