// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Drawing positions
global.drawPositionX = 315;
global.drawPositionY = 450;


enum InventoryItem {
	LavaShoe,
	WaterShoe,
	Spikes,
}

//Display Inventory Items
function displayInventory(){
	var cnt = 0;
	var k = 0;
	var p = 0;
	//Code is repetitive because we can't loop through the enum
	if(ds_map_exists(global.inventory, InventoryItem.Spikes)){
		var n = ds_map_find_value(global.inventory, InventoryItem.Spikes);
		for(var i = 0; i < n; i++){
			draw_sprite(spr_Spikes, 0, global.drawPositionX + k, global.drawPositionY + p);
			k += 185;
			cnt += 1;
			//Return to new row once the first one is filled
			if(p == 0 and cnt % 8 == 0){
				p = 175;
				k = 0;
			}
		}
	}
	
	if(ds_map_exists(global.inventory, InventoryItem.LavaShoe)){
		var n = ds_map_find_value(global.inventory, InventoryItem.LavaShoe);
		for(var i = 0; i < n; i++){
			draw_sprite(spr_LavaShoe, 0, global.drawPositionX + k, global.drawPositionY + p);
			k += 185;
			cnt += 1;
			if(p == 0 and cnt % 8 == 0){
				p = 175;
				k = 0;
			}
		}
	}
	
	if(ds_map_exists(global.inventory, InventoryItem.WaterShoe)){
		var n = ds_map_find_value(global.inventory, InventoryItem.WaterShoe);
		for(var i = 0; i < n; i++){
			draw_sprite(spr_WaterShoe, 0, global.drawPositionX + k, global.drawPositionY + p);
			k += 185;
			cnt += 1;
			if(p == 0 and cnt % 8 == 0){
				p = 175;
				k = 0;
			}
		}
	}
	
	
}

//Add item to inventory
function pickUpItem(itemType){
	//If there is enough space
	if(global.invSlots < global.invCapacity){
		//Check if key already exists in inventory map
		if(!ds_map_exists(global.inventory, itemType)){
			ds_map_add(global.inventory, itemType, 1);
		}else{
			var oldValue = ds_map_find_value(global.inventory, itemType);
			ds_map_replace( global.inventory, itemType, oldValue + 1);
		}
		instance_destroy();
		global.invSlots += 1;
	}
}

function pickupItemNoDestroy(itemType) {
	//If there is enough space
	if(global.invSlots < global.invCapacity){
		//Check if key already exists in inventory map
		if(!ds_map_exists(global.inventory, itemType)){
			ds_map_add(global.inventory, itemType, 1);
		}else{
			var oldValue = ds_map_find_value(global.inventory, itemType);
			ds_map_replace( global.inventory, itemType, oldValue + 1);
		}
		
		global.invSlots += 1;
	}
}
