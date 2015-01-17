package tsuzura;

import sys.FileSystem;
import haxe.io.Path;

class Haxelib extends tools.haxelib.Main {

	var env:Environment;

	public function new(env) {
		super();
		this.env = env;
	}

	public function installByName(project:String) {
		var info = site.infos(project);
		var v = getVersion(info, null);
		doInstall(project, v, true);
	}

	override function getRepository(?setup:Bool):String {
		FileSystem.createDirectory(env.installPath);
		return Path.addTrailingSlash(env.installPath);
	}
}
