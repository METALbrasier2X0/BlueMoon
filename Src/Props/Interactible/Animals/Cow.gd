extends CharacterBody2D


func _physics_process(delta):
	pass

func interact():
	var scene = load("res://Src/Props/Interactible/Collectable/Wood.tscn")
	var drop = scene.instantiate()
	add_child(drop)

	
