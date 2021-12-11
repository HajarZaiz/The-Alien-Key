event_inherited();

if (tileMovementProgress == -2.0 and patrolling) {

	if(patrollingPath[patrolIndex] == MoveDirection.TopLeft){
		show_debug_message("I have to go top left");
		moveDirection = MoveDirection.TopLeft;
		sprite_index = spriteTopLeft;
	}
	else if(patrollingPath[patrolIndex] == MoveDirection.TopRight){
		show_debug_message("I have to go top right");
		moveDirection = MoveDirection.TopRight;
		sprite_index = spriteTopRight;
	}
	else if(patrollingPath[patrolIndex] == MoveDirection.BottomLeft){
		show_debug_message("I have to go bottom left");
		moveDirection = MoveDirection.BottomLeft;
		sprite_index = spriteBottomLeft;
	}
	else if(patrollingPath[patrolIndex] == MoveDirection.BottomRight){
		show_debug_message("I have to go bottom right");
		moveDirection = MoveDirection.BottomRight;
		sprite_index = spriteBottomRight;
	}else {
		moveDirection = MoveDirection.Idle;
	}
	
	patrolIndex += 1;
	patrolIndex = patrolIndex % array_length(patrollingPath);
	
	if (moveDirection != MoveDirection.Idle) {
		tileMovementProgress = -1.0;
	}
}

//Collision Damage
if(instance_exists(obj_player)){
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
}


//This guard is supposed to be the dumbest one as he doesn't spot lava, spikes, and water during chasing
//Check if Guard is above Lava, Spikes and destroy him
var currentTileType = get_tile(tileX, tileY);

if(enumExistsInList(harmfulTiles, currentTileType)){
	instance_destroy();
}

if(instance_exists(obj_player)){
	var distanceToPlayer = abs(obj_player.x - x) + abs(obj_player.y - y)
	if(distanceToPlayer < observationRadius){
		//While player is to the left
		if(obj_player.tileX < tileX){
			//If the player is at the top
			if(obj_player.tileY < tileY){
				//Move top left
				moveDirection = MoveDirection.TopLeft;
				sprite_index = spriteTopLeft;
			}
			
			//If the player is at the bottom
			if(obj_player.tileY > tileY){
				//Move top left
				moveDirection = MoveDirection.BottomLeft;
				sprite_index = spriteBottomLeft;
			}
		}
		
		//While player is to the right
		if(obj_player.tileX > tileX){
			//If the player is at the top
			if(obj_player.tileY < tileY){
				//Move top left
				moveDirection = MoveDirection.TopRight;
				sprite_index = spriteTopRight;
			}
			
			//If the player is at the bottom
			if(obj_player.tileY > tileY){
				//Move top left
				moveDirection = MoveDirection.BottomRight;
				sprite_index = spriteBottomRight;
			}
		}
	}
}
