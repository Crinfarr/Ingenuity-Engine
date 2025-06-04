package;

import h3d.scene.pbr.PointLight;
import h3d.mat.Texture;
import h3d.shader.SpecularTexture;
import h3d.shader.pbr.PropsTexture;
import h3d.scene.pbr.Environment;
import h3d.mat.PbrMaterialSetup;
import hxd.Res;
import h3d.Vector;
import h3d.scene.Mesh;
import h3d.prim.Cube;
import h3d.prim.Sphere;

class Main extends hxd.App {
	var baseTarget:Vector = new Vector(0, 0, 1);
    var sun:PointLight;
    var sunTS:Float = 0.0;

	static function main() {
		hxd.Res.initEmbed();
		h3d.mat.MaterialSetup.current = new PbrMaterialSetup();
		@:keep final app = new Main();
	}

	override function init() {
		super.init();
		#if js
		if (!engine.driver.hasFeature(ShaderModel3)) {
			new h2d.Text(Res.font.DOTMATRIX.build(14), s2d).text = "WebGL 2.0 support required and not available on this browser.";
			return;
		}
		#end
		initSkybox();

		this.sun = new h3d.scene.pbr.PointLight(s3d);
		sun.setPosition(0, 0, 5);
		sun.range = 100;
		sun.power = 3;

		final floor_prim = new Cube(10, 10, 1);
		floor_prim.addNormals();
		floor_prim.addUVs();
        floor_prim.addTangents();
		floor_prim.translate(-5, -5, -0.5);

		final floor = new Mesh(floor_prim, s3d);
		final floor_shader = new PropsTexture(Res.tex.carbonfiber.Composed.toTexture());
        floor.material.texture = Res.tex.carbonfiber.Color.toTexture();
		floor.material.mainPass.addShader(floor_shader);
        floor.material.normalMap = Res.tex.carbonfiber.NormalGL.toTexture();

		s3d.camera.pos.set(0, 15, 6);
		s3d.camera.target = baseTarget;
	}

	private function initSkybox() {
		var skybox = new Sphere(1, 128, 128);
		skybox.addNormals();
		skybox.addUVs();

		var bg = new Mesh(skybox, s3d);
		bg.scale(10);
		bg.material.mainPass.culling = Front;
		bg.material.mainPass.setPassName("overlay");

		var envMap = new h3d.mat.Texture(1024, 1024, [Cube]);
		envMap.setName("Skybox");

		envMap.uploadPixels(Res.tex.skybox.common.jettelly_space_common_black_FRONT.getPixels(), 0, 0);
		envMap.uploadPixels(Res.tex.skybox.common.jettelly_space_common_black_BACK.getPixels(), 0, 1);
		envMap.uploadPixels(Res.tex.skybox.common.jettelly_space_common_black_RIGHT.getPixels(), 0, 2);
		envMap.uploadPixels(Res.tex.skybox.common.jettelly_space_common_black_LEFT.getPixels(), 0, 3);
		envMap.uploadPixels(Res.tex.skybox.common.jettelly_space_common_black_UP.getPixels(), 0, 4);
		envMap.uploadPixels(Res.tex.skybox.common.jettelly_space_common_black_DOWN.getPixels(), 0, 5);

		final env = new Environment(envMap);
		env.compute();
		var renderer = cast(s3d.renderer, h3d.scene.pbr.Renderer);
		renderer.env = env;
		bg.material.mainPass.addShader(new h3d.shader.pbr.CubeLod(env.env));
	}

	override function update(_delta:Float) {
		super.update(_delta);
        sunTS += _delta;
        sunTS %= 10;
        sun.x = 3*Math.sin(2*Math.PI*(sunTS/10));
        sun.y = 3*Math.cos(2*Math.PI*(sunTS/10));
		baseTarget = new Vector(0.6 * ((s2d.mouseX / s2d.width) - 0.5), 0.6 * ((s2d.mouseY / s2d.height) - 0.5), baseTarget.z);
		s3d.camera.target = baseTarget;
	}
}
