event_inherited();

if (tileMovementProgress == -2.0 and patrolling) {

	if (upRight > 0) {
		moveDirection = MoveDirection.TopRight;
		upRight = upRight - 1;
		sprite_index = spr_Guard1TopRight;
	}
	else if (downRight > 0 and upRight == 0) {
		moveDirection = MoveDirection.BottomRight;
		downRight = downRight -1;
		sprite_index = spr_Guard1BottomRight;
	}
	else if (downLeft > 0 ) {
		moveDirection = MoveDirection.BottomLeft;
		downLeft = downLeft -1;
		sprite_index = spr_Guard1BottomLeft;
	}
	else if (upLeft > 0) {
		moveDirection = MoveDirection.TopLeft;
		upLeft = upLeft - 1;
		sprite_index = spr_Guard1TopLeft;
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
//Check if Guard is above Lava, Spikes and destroy him. He can walk on water
var currentTileType = get_tile(tileX, tileY);
if(currentTileType == TileType.Lava or currentTileType == TileType.Spike){
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
				sprite_index = spr_Guard1TopLeft;
			}
			
			//If the player is at the bottom
			if(obj_player.tileY > tileY){
				//Move top left
				moveDirection = MoveDirection.BottomLeft;
				sprite_index = spr_Guard1BottomLeft;
			}
		}
		
		//While player is to the right
		if(obj_player.tileX > tileX){
			//If the player is at the top
			if(obj_player.tileY < tileY){
				//Move top left
				moveDirection = MoveDirection.TopRight;
				sprite_index = spr_Guard1TopLeft;
			}
			
			//If the player is at the bottom
			if(obj_player.tileY > tileY){
				//Move top left
				moveDirection = MoveDirection.BottomRight;
				sprite_index = spr_Guard1BottomLeft;
			}
		}
	}
}
