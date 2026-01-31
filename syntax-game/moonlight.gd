extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flicker()

func flicker() -> void:
	energy = randf() * 0.1 + 0.9
	scale = Vector2(3, 3) * energy
	await get_tree().create_timer(0.19).timeout
	flicker()
	pass
