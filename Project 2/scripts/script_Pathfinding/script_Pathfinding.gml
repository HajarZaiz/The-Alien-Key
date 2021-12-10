//A* search Algorithm
function A_star_search(start, destination, movableTiles){
	
	var neighbors;
	//Map to keep track of parent tiles:  tile --> parent tile
	parentTile = ds_map_create();
	//Solution path
	path = ds_list_create();
	//Set of tiles to be explored
	openList = ds_list_create();
	//The list of visited tiles
	closedList = ds_list_create();
	ds_list_add(openList, start);
	
	while(!ds_list_empty(openList)){
		var current = ds_list_find_value(openList, 0);
		
		//Get the tile with the lowest f cost
		for(var i = 0; i < ds_list_size(openList); i++){
			if(get_f_cost(start, ds_list_find_value(openList, i) ,destination) < get_f_cost(start, current ,destination)){
				current = ds_list_find_value(openList, i);
			}
		}

		ds_list_delete(openList, ds_list_find_index(openList, current));
		ds_list_add(closedList, current);

		// If we found our path
		if(current.x == destination.x and current.y == destination.y){
			// show_debug_message("GOTCHA");
			var c = {x: destination.x, y: destination.y};
			
			while(c.x != start.x or c.y != start.y){
				ds_list_add(path, c);
				var n = strToPos(ds_map_find_value(parentTile, posToStr({x: c.x, y: c.y})));
				c = n;
			}
			ds_list_add(path, start);
			// show_debug_message("The solution path is:");
			printList(path);
			return path;
		}
	
		
		//Type of each neighbor tile
		neighbors = get_surrounding_tiles(current.x, current.y);
		//Type and tile coordinates of neighbors
		var n = [
			{type: neighbors.topLeft, x:current.x - 1 , y: current.y - 1},
			{type: neighbors.topRight, x:current.x + 1 , y: current.y - 1},
			{type: neighbors.bottomLeft, x:current.x - 1 , y: current.y + 1},
			{type: neighbors.bottomRight, x:current.x + 1 , y: current.y + 1}
		]
		
		//Keep track of the parent tile
		currentStr = posToStr(current);
		ds_map_add(parentTile, posToStr({x: n[0].x, y: n[0].y}), currentStr);
		ds_map_add(parentTile, posToStr({x: n[1].x, y: n[1].y}), currentStr);
		ds_map_add(parentTile, posToStr({x: n[2].x, y: n[2].y}), currentStr);
		ds_map_add(parentTile, posToStr({x: n[3].x, y: n[3].y}), currentStr);
		
		//For each neighbor
		for(var i = 0; i < array_length(n); i++){
			//Check to see if the neighbor tile is not already visited
			if(!valueExistsInList(closedList, {x: n[i].x, y: n[i].y})){
				//Check to see if the neighbor tile is traversable
				if(can_move_on_tile(n[i].type, movableTiles)){
					//If it is not already in the open list add it
					if(!valueExistsInList(openList, {x: n[i].x, y: n[i].y})){
						ds_list_add(openList, {x: n[i].x, y: n[i].y});
					}
				}
			}
		}
		
	}
}

function posToStr(pos) {
	return string(pos.x) + " " + string(pos.y);
}

function strToPos(str) {
	var pos = string_pos(" ", str);
	return {
		x: real(string_copy(str, 0, pos)),
		y: real(string_copy(str, pos + 1, string_length(str) - 1))
	};
}

//Get the total cost of the tile F = G + H
//G is the distance between the current tile and the start tile
//H is the estimated distance between the current tile and the destination tile
function get_f_cost(start, current, destination){
	var gCost = abs(start.x - current.x) + abs(start.y - current.y);
	var hCost = abs(current.x - destination.x) + abs(current.y - destination.y);
	return gCost + hCost;
}

function valueExistsInList(list, value){
	for (var i = 0; i < ds_list_size(list); i++)
	{
	   var current = list[| i];
	   if(current.x == value.x and current.y == value.y){
		   return true;
	   }
	}
	return false;
}

function printList(list){
	for(var i = 0; i < ds_list_size(list); i++){
		show_debug_message(string(ds_list_find_value(list, i)));
	}
}