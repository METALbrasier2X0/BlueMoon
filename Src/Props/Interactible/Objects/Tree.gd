extends "res://Src/Props/Interactible/Objects/HarvestableItems.gd"
var State = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#checks if the equiped item is the one that can harvest said ressource
func interact(item):
	if item == 'axe' :
		var cutTree = preload("res://Assets/Spritsheets/tree2.png")
		get_node("Sprite2D").set_texture(cutTree)
		
		if State == true :
			var scene = load("res://Src/Props/Interactible/Collectable/Wood.tscn")
			var drop = scene.instantiate()
			add_child(drop)
			
		State = false
	
	
