event_inherited();

tileX = 6;
tileY = 4;


var coords = get_screen_coords(tileX, tileY);
x = coords.x;
y = coords.y;

var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

//patrolling variables
patrolling = true;
upRight = 3;
upLeft = 3;
downRight = 3;
downLeft = 3;

//Prevent decreasing health repetitively
canDamage = true;

movableTiles = [TileType.Ground, TileType.Lava, TileType.Water, TileType.Spike];
