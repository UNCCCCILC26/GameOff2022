extends Node2D

var playerBalance = 100000000000 setget set_balance

signal playerBalance_changed

var spawnedFruit = {"lemon":0,"coconut":0, "strawberry":0, "cherry":0, "raspberry":0, "blackberry":0, "blueberry":0, "watermelon":0}

func add_fruit(fruit,quantity):
	spawnedFruit[fruit] = spawnedFruit.get(fruit, 0) + int(quantity)
	
func clear_fruit():
	for k in spawnedFruit.keys():
		spawnedFruit[k] = 0
		

func set_balance(value):
		playerBalance=value
		emit_signal("set_balance", playerBalance)

var inventory = {"lemon":0,"coconut":0, "strawberry":0, "cherry":0, "raspberry":0, "blackberry":0, "blueberry":0, "watermelon":0}

func add_item(item,quantity):
	inventory[item] = inventory.get(item, 0) + int(quantity)

func remove_item(item,quantity):
	inventory[item] = inventory.get(item, 0) + int(quantity)
	
func _process(delta):
	pass

#The commit is for the sole purpose of staying ahead of Cody in commit count while also being worse at pushing useful commits.

#This commit is primarily used in order to achieve a higher count of "commits" than Matthew. I do not like Matthew.
