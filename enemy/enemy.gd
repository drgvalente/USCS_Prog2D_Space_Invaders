extends Area2D

@export var hp :float = 3.0
@export var speed := 100.0
var pos_x = 0
var pos_x_left_limit = 0
var pos_x_right_limit = 1152
var score_worth = 1

const coin_prefab = preload("res://coin/coin.tscn")
var coin_chance = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var e_speed = randf_range(-1, 1)
	if e_speed < 0:
		speed *= -1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x >= 800 or position.x <= 0:
		speed *= -1
	translate(Vector2.RIGHT * speed * delta)
	pass

func take_damage():
	hp -= 1
	if hp <= 0:
		var coin_drop_chance = randf_range(0, 100)
		if coin_drop_chance < coin_chance:
			var c = coin_prefab.instantiate()
			get_tree().root.get_child(0).add_child(c)
			c.position = global_position
		GameManager.score_change()
		queue_free()
