extends Node2D

var playerBalance = 100000000000 setget set_balance

signal playerBalance_changed

func set_balance(value):
		playerBalance=value
		emit_signal("set_balance", playerBalance)
