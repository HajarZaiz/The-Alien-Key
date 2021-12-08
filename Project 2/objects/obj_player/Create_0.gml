event_inherited();


var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

var coords = get_screen_coords(tileX, tileY);
x = coords.x;
y = coords.y;

// Map of InventoryItem
// Map<InventoryItem, int> (Item Type -> Count of Item)
global.inventory = ds_map_create();
//Inventory Capacity Variables
global.invSlots = 0;
global.invCapacity = 16;

previousDirection = MoveDirection.BottomLeft;

//For testing
//ds_map_add(global.inventory, InventoryItem.LavaShoe, 0);
//ds_map_add(global.inventory, InventoryItem.WaterShoe, 6);
ds_map_add(global.inventory, InventoryItem.Spikes, 4);
