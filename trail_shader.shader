shader_type canvas_item;

uniform float pulse_speed = 2.;
uniform sampler2D noise: hint_white;
uniform sampler2D gradient: hint_white;
uniform sampler2D pulse_gradient: hint_black;
void fragment() {
	float pos = COLOR.r;
	vec4 col = texture(gradient, vec2(pos,0));
	col.rgb += texture(
		pulse_gradient,
		vec2(fract(pos+pulse_speed*TIME),0)
	).rgb;
	COLOR = col;
}