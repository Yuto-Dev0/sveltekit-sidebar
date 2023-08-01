

precision highp float;

uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;
float time_modifier = 2./2.;
float pow_modifier = 0.1;
// float sphereCalc(float time){
// 	return pow(abs(sin((u_time + time)*time_modifier)),pow_modifier);
// }
// void main(){
// 	vec2 uv = gl_FragCoord.xy/u_resolution.xy;
// 	uv = (uv - 0.5) * 2.;
// 	uv.x *= u_resolution.x/u_resolution.y;
// 	float d = length(uv);
// 	if(d>sphereCalc(0.)&&(sphereCalc(0.01)>d)){
// 		gl_FragColor = vec4(d,d,1,1);
// 	}
	
// }

void main() {
	vec2 uv = gl_FragCoord.xy / u_resolution;
	uv = (uv - 0.5) * 2.;
	uv.x *= u_resolution.x/u_resolution.y;
	float d = length(uv);
	d -= pow(u_time*1., 1.);
	d = sin(d*9.);
	d = abs(d);
	d = smoothstep(0. , 0.1,d);
	
	vec4 bg = vec4(1,1,0,1);
	gl_FragColor = bg * vec4(d,d,d,1.);
}