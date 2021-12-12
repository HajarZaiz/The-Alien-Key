event_inherited();


if (tileMovementProgress == -2.0) {

	if(!searching){
		//Patrolling
		if (upRight > 0) {
			moveDirection = MoveDirection.TopRight;
			sprite_index = spr_SmartEnemyTopRight;
			upRight = upRight - 1;
		}
		else if (downRight > 0 and upRight == 0) {
			moveDirection = MoveDirection.BottomRight;
			sprite_index = spr_SmartEnemyBottomRight;
			downRight = downRight -1;
		}
		else if (downLeft > 0 ) {
			moveDirection = MoveDirection.BottomLeft;
			sprite_index = spr_SmartEnemyBottomLeft;
			downLeft = downLeft -1;
		}
		else if (upLeft > 0) {
			moveDirection = MoveDirection.TopLeft;
			sprite_index = spr_SmartEnemyTopLeft;
			upLeft = upLeft - 1;
		}
		else {
			//Reset
			upRight = 3;
			upLeft = 3;
			downRight = 3;
			downLeft = 3;
			moveDirection = MoveDirection.Idle;
		}
	}

	
	//Check the distance from the player to decide whether to start searching
	var distanceToPlayer = abs(obj_player.x - x) + abs(obj_player.y - y);
	if(distanceToPlayer < observationRadius){
		//Check if nearby and stop patrolling
		searching = true;
		path = A_star_search({x: tileX, y: tileY}, {x: obj_player.tileX, y: obj_player.tileY}, movableTiles);
		//Follow the path returned
		if( path != undefined and !ds_list_empty(path)){
			for (var i = ds_list_size(path) - 1; i > 0; i--)
			{
			   var nextTile = path[| i];
			   // show_debug_message("I'm trying to go to tile: ");
			   // show_debug_message(nextTile);
			   // show_debug_message("I'm currently in the tile: ");
			   // show_debug_message({x: tileX, y: tileY});
			   //If the next tile is to the left top
			   if(nextTile.x == tileX - 1 and nextTile.y == tileY - 1){
				    // show_debug_message("I should move left up");
					moveDirection = MoveDirection.TopLeft;
					sprite_index = spr_SmartEnemyTopLeft;
			   }
			   
			   if(nextTile.x == tileX + 1 and nextTile.y == tileY - 1){
				    // show_debug_message("I should move right up");
					moveDirection = MoveDirection.TopRight;
					sprite_index = spr_SmartEnemyTopRight;
			   }
			   
			   if(nextTile.x == tileX - 1 and nextTile.y == tileY + 1){
				    // show_debug_message("I should move left down");
					moveDirection = MoveDirection.BottomLeft;
					sprite_index = spr_SmartEnemyBottomLeft;
			   }
			   
			   if(nextTile.x == tileX + 1 and nextTile.y == tileY + 1){
				    // show_debug_message("I should move right down");
					moveDirection = MoveDirection.BottomRight;
					sprite_index = spr_SmartEnemyBottomRight;
			   }
				
				if (moveDirection != MoveDirection.Idle) {
					tileMovementProgress = -1.0;
				}
				// show_debug_message("I reached the tile: ");
				// show_debug_message(get_tile_coords(x, y));

			}
		}else{
			searching = false;
		}
	}
	
	if (moveDirection != MoveDirection.Idle) {
		tileMovementProgress = -1.0;
	}
}



//Collision
if (tileX == obj_player.tileX && tileY == obj_player.tileY && canDamage) {
	canDamage = !canDamage;
	audio_play_sound(sound_Hurt, 2, false);
	lives = lives - 1;
}

if(!canDamage && tileX != obj_player.tileX && tileY != obj_player.tileY){
	canDamage = !canDamage;
}

if(get_tile(tileX, tileY) == TileType.Spike){
	instance_destroy();
}



