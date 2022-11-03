extends KinematicBody2D

var base_speed = 100
var mouse_inside = false
var screenSize = Vector2(1024,600)
var velocity = Vector2(1,0)

func _ready():
	pass

func _on_LemonHitbox_mouse_entered():
	mouse_inside = true
	

func _on_LemonHitbox_mouse_exited():
	mouse_inside = false

func _process(_delta):
	if Input.is_action_just_pressed("mouse_clicked") and mouse_inside == true:
		queue_free()
	if position.x > screenSize.x+30 or position.x < -30:
		queue_free()

func _physics_process(delta):
	velocity = velocity.normalized() * base_speed
	velocity = move_and_slide(velocity)
