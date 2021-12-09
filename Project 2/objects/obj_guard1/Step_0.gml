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

if(!searching){
	//Check if nearby and stop patrolling
	searching = true;
	A_star_search({x: tileX, y: tileY}, {x: obj_player.tileX, y: obj_player.tileY}, movableTiles);
}


