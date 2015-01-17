package tsuzura;

import haxe.io.Path;
import sys.FileSystem;

class Environment {

	var libfilePath:String;
	public var installPath(default, null):String;

	public function new() {
		libfilePath = locateLibfile();
		if (libfilePath == null) throw 'libfile.json not found';
		installPath = Path.join([Path.directory(libfilePath), '.haxelib']);
	}

	function locateLibfile():String {
		var current = Sys.getCwd();
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
