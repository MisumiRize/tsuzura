package tsuzura.cli;

import sys.io.Process;
import tsuzura.Installer;
import tsuzura.Environment;

class InstallCommand extends halc.Command {

	public function new() {
		super('install');
		shortName = 'i';
		action = function(context:halc.Context) {
			doInstall(context);
		}
		appendFlag(new halc.Flag<String>('libfile', '', ''));
	}

	public function doInstall(context:halc.Context) {
		var env = new Environment();
		var definition = env.loadDefinition();
		var installer = new Installer(env);
		installer.install(definition);
	}
}
