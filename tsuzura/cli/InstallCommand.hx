package tsuzura.cli;

import tsuzura.Installer;
import tsuzura.Environment;

class InstallCommand extends halc.Command {

	public function new() {
		super('install');
		shortName = 'i';
		action = function(context:halc.Context) {
			doInstall(context);
		}
	}

	public function doInstall(context:halc.Context) {
		var cwd = context.args()[0];
		var env = new Environment(cwd);
		var definition = env.loadDefinition();
		var installer = new Installer(env);
		installer.install(definition);
	}
}
