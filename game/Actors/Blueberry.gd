extends "res://Actors/BaseEnemy.gd"

var movingRight = false

func _ready():
	base_speed = 200
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
	
	while(true):
		yield(get_tree().create_timer(1.25),"timeout")
		stopMovement()
		yield(get_tree().create_timer(0.35),"timeout")
		if(movingRight):
			moveRight()
		else:
			moveLeft()
