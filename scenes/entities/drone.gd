extends CharacterBody2D

var direction: Vector2
var speed := 50
var player: CharacterBody2D
var health := 3

func _on_detection_area_body_entered(player_body: CharacterBody2D) -> void:
	player = player_body

func _physics_process(_delta: float) -> void:
	if player:
		var dir = (player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()


func _on_detection_area_body_exited(_player_body: CharacterBody2D) -> void:
	player = null# Replace with function body.


func _on_collision_area_body_entered(_body: Node2D) -> void:
	explode()

func hit():
	health -= 1
	if health <= 0:
		explode()	

func explode():
	speed = 0
	$AnimatedSprite2D.hide()
	$ExplosionSPrite.show()
	$AnimationPlayer.play("explode")
	await $AnimationPlayer.animation_finished
	queue_free()	
