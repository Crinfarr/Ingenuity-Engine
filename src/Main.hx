package;

import h3d.scene.fwd.LightSystem;
import h3d.scene.fwd.PointLight;
import h3d.Vector;
import h3d.scene.Mesh;
import h3d.prim.Cube;
import h3d.prim.Plane2D;

class Main extends hxd.App {
	var baseTarget:Vector = new Vector(0, 0, 1);

	override function init() {
		final floor = new Cube(10, 10, 1);
		{
			floor.addNormals();
			floor.translate(-5, -5, -0.5);
		}
		final floor_m = new Mesh(floor, s3d);
		{
			floor_m.material.mainPass.enableLights = true;
			floor_m.material.shadows = true;
		}
		cast(s3d.lightSystem, LightSystem).ambientLight.set(0, 0, 0.5);
		cast(s3d.lightSystem, LightSystem).ambientLight.setColor(0xfff0f0);

		s3d.camera.pos.set(0, 15, 6);
		s3d.camera.target = baseTarget;
		s3d.camera.zNear = 5;
		s3d.camera.zFar = 40;
        for (i in 0...20) {
            var card = new Cube(0.63, 0.88, 0.01);
            card.addNormals();
            var card_m = new Mesh(card, s3d);
			card_m.setPosition(Math.floor(Math.random() * 10)-5, Math.floor(Math.random() * 10)-5, 0.6);
			card_m.setRotation(0, 0, Math.random() * Math.PI * 2);
            card_m.material.color.setColor(0x0088ff);
        }
	}

	static function main() {
		@:keep final app = new Main();
	}

	override function update(_delta:Float) {
		super.update(_delta);
		baseTarget = new Vector(0.6 * ((s2d.mouseX / s2d.width) - 0.5), 0.6 * ((s2d.mouseY / s2d.height) - 0.5), baseTarget.z);
		s3d.camera.target = baseTarget;
	}
}
