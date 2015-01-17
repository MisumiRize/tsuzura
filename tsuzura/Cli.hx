package tsuzura;

import tsuzura.cli.InstallCommand;

class Cli {

	static public function main() {
		var app = new halc.App('tsuzura');
		var install = new InstallCommand();
		app.appendCommand(install);
		app.action = install.action;
		app.run(Sys.args());
	}
}
