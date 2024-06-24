extends RefCounted

class_name ListAdapter

## Gives a set of behaviors to create cells for a list of models.
## 
## Handles adding and updating cells with models.
## Initialise giving:
## - [param in_models]: [Dictionary] the models dictionary
## - [param in_list_view]: [Container] to add the cells to
## - [param cell_packed_scene]: [PackedScene], a [Container] to be instanciated to create the cell.
## - [param in_bind_model] has 3 parameters
##		- [param cell]: [Container], 
##		- [param model_key]: [any] the key for the item in the dictionary, 
##		- [param model]: [any] the model itself that will be attached to the cell as a meta
##		[codeblock]
##			func bind_model(cell: Container, model_key: any , model: any):
##				pass
##		[/codeblock]


var list_view : Container
var models : Dictionary
var bind_model: Callable
var cell_packed_scene: PackedScene

const MODEL_KEY = "model_key"


func _init( in_models: Dictionary, 
			in_list_view: Container, 
			in_cell_packed_scene: PackedScene, 
			in_bind_model: Callable):
	models = in_models 
	list_view = in_list_view
	cell_packed_scene = in_cell_packed_scene
	bind_model = in_bind_model
	create_cells()


func create_cells():
	for model_key in models:
		var model = models.get(model_key)
		var cell = add_cell_to_list(model_key, model)
		list_view.add_child(cell)
		list_view.set_meta(model_key, cell)


func add_cell_to_list(model_key, model):
	var cell: Container = cell_packed_scene.instantiate()
	cell.set_meta(MODEL_KEY, model)
	bind_model.call(cell, model_key, model)
	return cell
	

func update_existing_cells():
	var cells = list_view.get_children()
	for cell in cells:
		var cell_model_key = cell.get_meta(MODEL_KEY)
		if (models.has(cell_model_key)):
			var entry = models.get(cell_model_key)
			bind_model.call(cell, cell_model_key, entry)


func update_item(model_key: String, model: int):
	var cell = list_view.get_meta(model_key)
	if (cell == null):
		add_cell_to_list(model_key, model)
	else:
		cell.update_amount(model)
