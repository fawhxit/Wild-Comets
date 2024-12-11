//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = vec4(0.0,0.0,0.0,v_vColour.r+v_vColour.g+v_vColour.b);
}
