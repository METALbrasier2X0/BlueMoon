extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func create_instance(add):
	var scene = load(add)
	var scene_instance = scene.instance()
	
	return scene_instance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tree_exited():
	print ('test')
