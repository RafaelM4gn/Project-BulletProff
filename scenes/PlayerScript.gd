extends KinematicBody2D

onready var bullet_instance = preload("res://Scenes/Bullet.tscn")
onready var bullet2_instance = preload("res://Scenes/Bullet2.tscn")
onready var bullet3_instance = preload("res://Scenes/Bullet3.tscn")

var positions = [380, 430, 500, 570, 630]
var current_position = 2
var y = 500
var player_speed = 0.1

onready var tween = $Tween

var motion = Vector2.ZERO;
var speed = 200

var shoot_type = 3

func _ready():
	self.position = Vector2(positions[current_position], y)

func _process(delta):
	if Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_left"):
		$PlayerSprite.play("turn")
	else:
		$PlayerSprite.play("idle")

	if Input.is_action_pressed("ui_right"):
		$PlayerSprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		$PlayerSprite.flip_h = false

	if Input.is_action_just_pressed("move_left"):
		move_left()
	
	if Input.is_action_just_pressed("move_right"):
		move_right()
		
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	move_and_slide(motion,Vector2.UP)


func move_left():
	#check if player is not moving
	if tween.is_active():
		return
	elif current_position > 0:
		current_position -= 1
		tween.interpolate_property(self, "position", self.position, Vector2(positions[current_position], y), player_speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func move_right():
	if tween.is_active():
		return
	elif current_position < positions.size() - 1:
		current_position += 1
		tween.interpolate_property(self, "position", self.position, Vector2(positions[current_position], y), player_speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

	

func shoot():
	$PlayerSprite.play("attack")
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
