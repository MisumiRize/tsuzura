package tsuzura;

import tsuzura.cli.InstallCommand;

class Cli {

	static public function main() {
		var install = new InstallCommand();
		var app = new halc.App({
			name:'tsuzura',
			action:install.action,
			commands:[install],
		});
		app.run(Sys.args());
	}
}
