package tsuzura;

import haxe.io.Path;
import sys.FileSystem;

class Environment {

	var libfilePath:String;
	public var installPath(default, null):String;

	public function new(cwd:String) {
		libfilePath = locateLibfile(cwd);
		if (libfilePath == null) throw 'libfile.json not found';
		installPath = Path.join([Path.directory(libfilePath), '.haxelib']);
	}

	function locateLibfile(cwd:String):String {
		var current = cwd;
		var previous = '';

		while (current != '/' && current != previous) {
			var p = Path.join([current, 'libfile.json']);

			if (FileSystem.exists(p) && !FileSystem.isDirectory(p)) {
				return p;
			}

			previous = current;
			current = Path.directory(current);
		}

		return null;
	}

	public function loadDefinition():Definition {
		return Definition.build(libfilePath);
	}
}
