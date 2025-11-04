extends CharacterBody2D

var direction: Vector2 = Vector2.RIGHT
var speed := 50

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
