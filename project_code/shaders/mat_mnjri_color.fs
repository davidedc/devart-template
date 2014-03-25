precision mediump float;

varying vec2 uv;
varying float dist;

uniform vec3 unib[4];
//uniform float blend ====> unib[0][2]
uniform vec3 unif[20];
//uniform vec3 fogshade ==> unif[4]
//uniform float fogdist ==> unif[5][0]
//uniform float fogalpha => unif[5][1]

void main(void) {
  vec3 rgbi =  unif[16];
  vec3 rgbf =  unif[17];


  float a = unif[18][2] * 800.0;
  float b = unif[18][0] * 10.0 + 300.0;
  float c = unif[18][1] * 200.0 + 150.0;
  float g = 0.25;
  float e = b * (uv.x * 0.5 - 0.5);
  float f = b * (uv.y * 0.5 - 0.5);
  float i = c + sin(e * g + a / 150.0) * 20.0;
  float d = c + cos(f * g / 2.0) * 18.0 + cos(e * g) * 7.0;
  float r = length(vec2(i - e, d - f));
  float q = f / r;
  e = (r * cos(q)) - a / 2.0;
  f = (r * sin(q)) - a / 2.0;
  float h = ((f + d) + a / 2.0) * g;
  i += cos(h * 2.3 * sin(a / 350.0 - q)) * 184.0 * sin(q - (r * 4.3 + a / 12.0) * g) + 
       tan(r * g + h) * 184.0 * cos(r * g + h);
  i = mod(i / 5.6, 256.0)/64.0;
  i = 2.0 - abs(i - 2.0);
  d = r / 350.0;
  d += sin(d * d * 8.0) * 0.52;
  f = (sin(a * g) + 1.0) / 2.0;
  gl_FragColor = vec4(mix(rgbi, rgbf, vec3(f * i / 1.6, i / 2.0 + d / 13.0, i) * d * uv.x +
                      vec3(i / 1.3 + d / 8.0, i / 2.0 + d / 18.0, i) * d * (1.0 - uv.x)), 1.0);
}


