/* outline fragment shader */
varying vec2 texture_coordinate;
varying vec4 vertex_color;

uniform vec2 sprite_texel_dimensions;
const vec3 outline_color = vec3(.5, .5, .8);

void main() {
  vec4 this_pixel = texture2D(gm_BaseTexture, texture_coordinate);
  vec2 texel_offsets[8];
  texel_offsets[0] = vec2(1.0, 0.0);
  texel_offsets[1] = vec2(1.0, -1.0);
  texel_offsets[2] = vec2(0.0, -1.0);
  texel_offsets[3] = vec2(-1.0, -1.0);
  texel_offsets[4] = vec2(-1.0, 0.0);
  texel_offsets[5] = vec2(-1.0, 1.0);
  texel_offsets[6] = vec2(0.0, 1.0);
  texel_offsets[7] = vec2(1.0, 1.0);
  
  //loop through each neighboring pixel and grab the alpha value
  float alpha_accumulation = 0.0;
  for (int iteration = 0; iteration < 8; iteration += 1) {
    alpha_accumulation = alpha_accumulation + texture2D(gm_BaseTexture, texture_coordinate + (texel_offsets[iteration] * sprite_texel_dimensions)).a;
  }

  //if this pixel's alpha is 0 and the accumulated alpha is greater than 0, then we are a invisible pixel touching a visible pixel so we are part of the outline
  if (this_pixel.a == 0.0 && alpha_accumulation > 0.0) {
    this_pixel = vec4(outline_color, 1.0);
  }

  gl_FragColor = this_pixel * vertex_color;
}