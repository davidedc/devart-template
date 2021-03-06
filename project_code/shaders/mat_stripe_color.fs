precision mediump float;

varying vec2 uv;
varying float dist;

uniform sampler2D tex0;
uniform vec3 unib[4];
//uniform float blend ====> unib[0][2]
uniform vec3 unif[20];
//uniform vec3 fogshade ==> unif[4]
//uniform float fogdist ==> unif[5][0]
//uniform float fogalpha => unif[5][1]

void main(void) {
  vec3 rgbi =  unif[16];
  vec3 rgbf =  unif[17];

  float stripeCount =  unif[18][0];
  float wave1 = unif[18][1];
  float wave2 = 4.0 * pow(unif[18][2], 0.333333);
  float f = fract((uv.x + uv.y) * stripeCount * 0.5 + 0.3 * wave1 * sin(stripeCount * 4.0 * uv.x * wave2));
  //float f = fract((uv.x + uv.y) * stripeCount * 0.5);
  f = step(0.5, f);

  gl_FragColor = vec4(mix(rgbf, rgbi, f), 1.0);
  if (gl_FragColor.r < 0.0 || gl_FragColor.g < 0.0 || gl_FragColor.b < 0.0) discard;
}


