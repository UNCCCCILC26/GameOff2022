extends "res://Actors/BaseEnemy.gd"



func _ready():
	base_speed = 0
	stopMovement()
	self.position.x = 512
	self.position.y = 300
