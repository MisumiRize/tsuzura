package tsuzura;

import haxe.Json;
import sys.io.File;

typedef Libfile = {
	var dependencies:Dynamic;
}

abstract VersionInfo(String) from String to String {
}

class Definition {

	public var dependencies(default, null) = new Map<String, VersionInfo>();

	public function new() { }

	public function setDependency(name:String, version:VersionInfo) {
		dependencies.set(name, version);
	}

	static public function build(libfilePath:String):Definition {
		var def = new Definition();
		var json = File.getContent(libfilePath);
		var libfile:Libfile = Json.parse(json);
		var dep = libfile.dependencies;
		switch (Type.typeof(dep)) {
			case TNull:
			case TObject:
				var fields = Reflect.fields(libfile.dependencies);
				for (f in fields) {
					var v:VersionInfo = Reflect.field(libfile.dependencies, f);
					def.setDependency(f, v);
				}
			default:
				throw 'invalid json';
		}
		return def;
	}
}
