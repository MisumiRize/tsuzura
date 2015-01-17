package tsuzura;

class Installer {

	var haxelib:Haxelib;

	public function new(env:Environment) {
		haxelib = new Haxelib(env);
	}

	public function install(definition:Definition) {
		var names = definition.dependencies.keys();
		for (name in names) {
			haxelib.installByName(name);
		}
	}
}
