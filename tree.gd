extends Sprite2D

func play_randomized(animation_name : String):
	randomize()
	$AnimationPlayer.play(animation_name)
	var offset : float = randf_range(0, $AnimationPlayer.current_animation_length)
	$AnimationPlayer.advance(offset)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_randomized("Sway")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
