/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
movableTiles = [TileType.Water];

harmfulTiles = ds_list_create();
ds_list_add(harmfulTiles, TileType.Lava);
ds_list_add(harmfulTiles, TileType.Spike);
ds_list_add(harmfulTiles, TileType.Ground);

