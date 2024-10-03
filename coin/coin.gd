extends Area2D

var speed = 50
var worth = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(Vector2.DOWN * speed * delta)
	if position.y > 800:
		queue_free()
	pass
