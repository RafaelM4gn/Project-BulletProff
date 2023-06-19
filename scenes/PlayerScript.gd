extends KinematicBody2D

onready var bullet_instance = preload("res://Scenes/Bullet.tscn")
onready var bullet2_instance = preload("res://Scenes/Bullet2.tscn")
onready var bullet3_instance = preload("res://Scenes/Bullet3.tscn")

var motion = Vector2.ZERO;
var speed = 200

var shoot_type = 1

func _process(delta):
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		$PlayerSprite.play("turn")
	if motion.x ==0:
		$PlayerSprite.play("idle")
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$PlayerSprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$PlayerSprite.flip_h = false
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	move_and_slide(motion,Vector2.UP)

func shoot():
	if shoot_type >= 1 and shoot_type < 2:
		var bullet = bullet_instance.instance()
		bullet.direction = $PlayerShootSpawn.global_position - global_position
		bullet.global_position = $PlayerShootSpawn.global_position
		get_tree().get_root().add_child(bullet)
	elif shoot_type >= 2 and shoot_type < 3:
		var bullet = bullet2_instance.instance()
		bullet.direction = $PlayerShootSpawn.global_position - global_position
		bullet.global_position = $PlayerShootSpawn.global_position
		get_tree().get_root().add_child(bullet)
	elif shoot_type == 3:
		var bullet = bullet3_instance.instance()
		bullet.direction = $PlayerShootSpawn.global_position - global_position
		bullet.global_position = $PlayerShootSpawn.global_position
		get_tree().get_root().add_child(bullet)
