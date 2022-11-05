extends Node2D


var playerBalance = 100000000000 setget set_balance

signal playerBalance_changed

func set_balance(value):
		playerBalance=value
		emit_signal("set_balance", playerBalance)


var inventory = {"lemon":0,"coconut":0, "strawberry":0, "cherry":0, "raspberry":0, "blackberry":0, "blueberry":0, "watermelon":0}

func add_item(item,quantity):
	inventory[item] = inventory.get(item, 0) + int(quantity)

func remove_item(item,quantity):
	inventory[item] = inventory.get(item, 0) + int(quantity)
	
	
	
