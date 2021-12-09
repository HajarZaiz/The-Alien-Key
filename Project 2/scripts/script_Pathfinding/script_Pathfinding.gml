//A* search Algorithm
function A_star_search(start, destination, movableTiles){
	
	var neighbors;
	//Solution path
	path = ds_list_create();
	//Set of tiles to be explored
	openList = ds_list_create();
	//The list of visited tiles
	closedList = ds_list_create();
	ds_list_add(openList, start);
	
	for(var a= 0; a < 10; a++){
		var current = ds_list_find_value(openList, 0);
		
		//Get the tile with the lowest f cost
		for(var i = 0; i < ds_list_size(openList); i++){
			if(get_f_cost(start, ds_list_find_value(openList, i) ,destination) < get_f_cost(start, current ,destination)){
				current = ds_list_find_value(openList, i);
			}
		}
		//TESTING
		show_debug_message("Lowest cost tile: ");
		show_debug_message(current);
		//TESTING END
		//Remove from openlist and add to closed list
		ds_list_delete(openList, ds_list_find_index(openList, current));
		ds_list_add(closedList, current);
		//TESTING
		show_debug_message("open list: ");
		printList(openList);
		show_debug_message("closed list: ");
		printList(closedList);
		//TESTING END
		
		//If we found our path
		if(current == destination){
			//TO DO: Backtrack
			return;
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

		
		//For each neighbor
		for(var i = 0; i < array_length(n); i++){
			//Check to see if the neighbor tile is not already visited
			if(ds_list_find_index(closedList, {x: n[i].x, y: n[i].y}) == -1){
				show_debug_message("The neighbor");
				show_debug_message({x: n[i].x, y: n[i].y});
				show_debug_message("Never visited");
	
				//Check to see if the neighbor tile is traversable
				if(can_move_on_tile(n[i].type, movableTiles)){
					//If it is not already in the open list add it
					if(ds_list_find_index(openList, {x: n[i].x, y: n[i].y}) == -1){
						ds_list_add(openList, {x: n[i].x, y: n[i].y});
					}
				}
			}
		}
		
	}
}

//Get the total cost of the tile F = G + H
//G is the distance between the current tile and the start tile
//H is the estimated distance between the current tile and the destination tile
function get_f_cost(start, current, destination){
	var gCost = abs(start.x - current.x) + abs(start.y - current.y);
	var hCost = abs(current.x - destination.x) + abs(current.y - destination.y);
	return gCost + hCost;
}

function printList(list){
	for(var i = 0; i < ds_list_size(list); i++){
		show_debug_message(string(ds_list_find_value(list, i)));
	}
}