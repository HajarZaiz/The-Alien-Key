event_inherited();

tileX = initialX;
tileY = initialY;


var coords = get_screen_coords(tileX, tileY);
x = coords.x;
y = coords.y;

var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

//patrolling variables
patrolling = true;

patrolIndex = 0;

//Prevent decreasing health repetitively
canDamage = true;

movableTiles = [TileType.Ground, TileType.Lava, TileType.Water, TileType.Spike];
harmfulTiles = ds_list_create();
ds_list_add(harmfulTiles, TileType.Lava);
ds_list_add(harmfulTiles, TileType.Water);
ds_list_add(harmfulTiles, TileType.Spike);