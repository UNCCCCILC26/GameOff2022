extends Node2D

#Balance
var playerBalance = 100000000000 setget set_balance
signal playerBalance_changed
func set_balance(value):
		playerBalance=value
		emit_signal("set_balance", playerBalance)

#Spawned Fruit
var spawnedFruit = {"lemon":0,"coconut":0, "strawberry":0, "cherry":0, "raspberry":0, "blackberry":0, "blueberry":0, "watermelon":0}
func add_fruit(fruit,quantity):
	spawnedFruit[fruit] = spawnedFruit.get(fruit, 0) + int(quantity)
func clear_fruit():
	for k in spawnedFruit.keys():
		spawnedFruit[k] = 0

#Inventory
var inventory = {"lemon":0,"coconut":0, "strawberry":0, "cherry":0, "raspberry":0, "blackberry":0, "blueberry":0, "watermelon":0}
func add_item(item,quantity):
	inventory[item] = inventory.get(item, 0) + int(quantity)
func remove_item(item,quantity):
	inventory[item] = inventory.get(item, 0) + int(quantity)

#Spawned Fruit
var cup = {"ice":0, "sweetener":0, "flavoring":0}


func _process(delta):
	pass

#What ever cody said is wrong.
