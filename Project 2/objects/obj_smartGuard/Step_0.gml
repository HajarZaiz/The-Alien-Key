event_inherited();


if (tileMovementProgress == -2.0) {

	if (upRight > 0) {
		moveDirection = MoveDirection.TopRight;
		upRight = upRight - 1;
	}
	else if (downRight > 0 and upRight == 0) {
		moveDirection = MoveDirection.BottomRight;
		downRight = downRight -1;
	}
	else if (downLeft > 0 ) {
		moveDirection = MoveDirection.BottomLeft;
		downLeft = downLeft -1;
	}
	else if (upLeft > 0) {
		moveDirection = MoveDirection.TopLeft;
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
	
	if (moveDirection != MoveDirection.Idle) {
		tileMovementProgress = -1.0;
	}
}



//Collision
if (tileX == obj_player.tileX && tileY == obj_player.tileY && canDamage) {
	canDamage = !canDamage;
	lives = lives - 1;
	if(lives <= 0){
		room_goto(GameOver);
	}
}

if(!canDamage && tileX != obj_player.tileX && tileY != obj_player.tileY){
	canDamage = !canDamage;
}

var distanceToPlayer = abs(obj_player.x - x) + abs(obj_player.y - y)
if(distanceToPlayer < observationRadius){
	//Check if nearby and stop patrolling
	searching = true;
	path = A_star_search({x: tileX, y: tileY}, {x: obj_player.tileX, y: obj_player.tileY}, movableTiles);
	//Follow the path returned
	for (var i = ds_list_size(path) - 1; i > 0; i--)
	{
	   var nextTile = path[| i];
	   //If the next tile is to the left
		if(nextTile.x < tileX){
			//If the next tile is at the top
			if(nextTile.y < tileY){
				//Move top left
				moveDirection = MoveDirection.TopLeft;
				sprite_index = spr_SmartEnemyTopLeft;
			}
			
			//If the player is at the bottom
			if(nextTile.y > tileY){
				//Move top left
				moveDirection = MoveDirection.BottomLeft;
				sprite_index = spr_SmartEnemyBottomLeft;
			}
		}
		
		//If the next tile is to the right
		if(nextTile.x > tileX){
			//If the next tile is at the top
			if(nextTile.y < tileY){
				//Move top left
				moveDirection = MoveDirection.TopRight;
				sprite_index = spr_SmartEnemyTopRight;
			}
			
			//If the player is at the bottom
			if(nextTile.y > tileY){
				//Move top left
				moveDirection = MoveDirection.BottomRight;
				sprite_index = spr_SmartEnemyBottomRight;
			}
		}
	}
}


