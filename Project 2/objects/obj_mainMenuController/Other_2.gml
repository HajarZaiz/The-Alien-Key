/// @description Insert description here
// You can write your code in this editor

global.particleSystem = part_system_create_layer(layer, true);
global.dustParticle = part_type_create();
global.waterParticle = part_type_create();
global.lavaParticle = part_type_create();

part_type_shape(global.dustParticle, pt_shape_pixel);
part_type_size(global.dustParticle, 5, 15, 0, 0.5);
part_type_color1(global.dustParticle, c_ltgray);
part_type_alpha2(global.dustParticle, 1.0, 0.0);
part_type_speed(global.dustParticle, 2, 5, -0.1, 0);
part_type_direction(global.dustParticle, 0, 360, 0, 0);
part_type_blend(global.dustParticle, true);
part_type_life(global.dustParticle, 30, 60);

part_type_shape(global.waterParticle, pt_shape_pixel);
part_type_size(global.waterParticle, 5, 15, 0, 0.5);
part_type_color1(global.waterParticle, make_color_rgb(37, 193, 84));
part_type_alpha2(global.waterParticle, 1.0, 0.0);
part_type_speed(global.waterParticle, 2, 5, -0.1, 0);
part_type_direction(global.waterParticle, 0, 360, 0, 0);
part_type_blend(global.waterParticle, true);
part_type_life(global.waterParticle, 30, 60);

part_type_shape(global.lavaParticle, pt_shape_pixel);
part_type_size(global.lavaParticle, 5, 15, 0, 0.5);
part_type_color1(global.lavaParticle, make_color_rgb(204, 133, 0));
part_type_alpha2(global.lavaParticle, 1.0, 0.0);
part_type_speed(global.lavaParticle, 2, 5, -0.1, 0);
part_type_direction(global.lavaParticle, 0, 360, 0, 0);
part_type_blend(global.lavaParticle, true);
part_type_life(global.lavaParticle, 30, 60);
