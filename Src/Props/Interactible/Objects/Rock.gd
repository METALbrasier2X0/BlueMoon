extends "res://Src/Props/Interactible/Objects/HarvestableItems.gd"
var State = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact(item):
	State = State + 1
	var scene = load("res://Src/Props/Interactible/Collectable/Rock_Drop.tscn")
	var drop = scene.instantiate()
	
	if State <= 3 :
		add_child(drop)
	else :
		queue_free()
	
