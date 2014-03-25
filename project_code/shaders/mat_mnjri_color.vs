precision mediump float;

attribute vec3 vertex;
attribute vec2 texcoord;

uniform mat4 modelviewmatrix[2]; // 0 model movement in real coords, 1 in camera coords
uniform vec3 unib[4];
//uniform vec2 umult, vmult => unib[2]
//uniform vec2 u_off, v_off => unib[3]

varying vec2 uv;
varying float dist;

void main(void) {
  uv = texcoord * unib[2].xy + unib[3].xy;
  gl_Position = modelviewmatrix[1] * vec4(vertex,1.0);
  dist = gl_Position.z;
  gl_PointSize = clamp(6.0 * unib[2][2]/dist, 1.0, unib[2][2]);
}
