//Add Spikes to inventory
if( keyboard_check_pressed(ord("T"))){
	pickUpItem(InventoryItem.Spikes);
}
//Add Water Shoe to inventory
if( keyboard_check_pressed(ord("W"))){
	pickUpItem(InventoryItem.Spikes);
}

//Add LavaShoe to inventory
if( keyboard_check_pressed(ord("L"))){
	pickUpItem(InventoryItem.Spikes);
}

//Increase lives
if( keyboard_check_pressed(ord("H"))){
	if(lives < 6){
		lives = lives + 1;
	}
}