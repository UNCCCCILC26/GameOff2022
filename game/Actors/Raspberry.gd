extends "res://Actors/BaseEnemy.gd"

var movingRight = false
var posCheck = true

func _ready():
	base_speed = 100
	rng.randomize()
	var randY = rng.randf_range(50,screenSize.y-50)
	if(rng.randi_range(0,1) == 1):
		self.position = Vector2(-30,randY)
		moveRight()
		movingRight = true
	else:
		self.position = Vector2(screenSize.x+30,randY)
		moveLeft()
		movingRight = false
	
func _process(delta):
	if(position.x < ((screenSize.x/2)+20) and position.x > ((screenSize.x/2)-20) and posCheck):
		posCheck = false
		shootPlayer()
		yield(get_tree().create_timer(1.25),"timeout")
		if(movingRight):
			moveRight()
		else:
			moveLeft()
	
func shootPlayer():
	stopMovement()
	base_speed = 300
