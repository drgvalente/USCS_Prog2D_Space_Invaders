extends Node

@onready var enemy_preload = preload("res://enemy/enemy.tscn")
var enemy_cooldown = 0.3
var enemy_current_cooldown = 0

const hud_preload = preload("res://hud/hud.tscn")
var hud
var lbl_score

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hud = hud_preload.instantiate()
	get_tree().root.get_child(0).add_child(hud)
	lbl_score = hud.get_node("lbl_score")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	enemy_current_cooldown += delta
	if enemy_current_cooldown >= enemy_cooldown:
		enemy_current_cooldown = 0
		var e = enemy_preload.instantiate()
		get_tree().root.get_child(0).add_child(e)
		var pos_x = randf_range(100, 700)
		var pos_y = randf_range(50, 200)
		e.position = Vector2(pos_x, pos_y)
	pass

func score_change():
	score += 1
	lbl_score.text = "Points: " + str(score)
	pass
