extends RefCounted

class_name ListAdapter

var list_view : Container
var models : Dictionary
var bind_model: Callable
var add_new_cell: Callable

const MODEL_KEY = "model_key"

func _init(in_models: Dictionary, in_list_view: Container, in_add_new_cell: Callable, in_bind_model: Callable):
	models = in_models 
	list_view = in_list_view
	add_new_cell = in_add_new_cell
	bind_model = in_bind_model


## @param add_new_cell must return a [Container] to be added to the list.
## @param bind_model takes 3 args, 
## 	the cell, 
## 	the key for the item, 
## 	and the item itself
func create_cells( add_new_cell: Callable):
	for model_key in models:
		var entry = models.get(model_key)
		var cell: Container = add_new_cell.call()
		cell.set_meta(MODEL_KEY, entry)
		bind_model.call(cell, model_key, entry)
		list_view.add_child(cell)
		list_view.set_meta(model_key, cell)


func update_grid():
	var cells = list_view.get_children()
	for cell in cells:
		var cell_model_key = cell.get_meta(MODEL_KEY)
		if (models.has(cell_model_key)):
			var entry = models.get(cell_model_key)
			bind_model.call(cell, cell_model_key, entry)


func _update_item(in_name: String, in_amount: int):
	var cell = grid_container.get_meta(in_name)
	if (cell == null):
		_add_new_cell(in_name, in_amount)
	else:
		cell.update_amount(in_amount)



