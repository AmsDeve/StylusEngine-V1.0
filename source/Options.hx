package;

import lime.app.Application;
import lime.system.DisplayMode;
import flixel.util.FlxColor;
import Controls.KeyboardScheme;
import flixel.FlxG;
import openfl.display.FPS;
import openfl.Lib;

class OptionCategory
{
	private var _options:Array<Option> = new Array<Option>();
	public final function getOptions():Array<Option>
	{
		return _options;
	}

	public final function addOption(opt:Option)
	{
		_options.push(opt);
	}

	
	public final function removeOption(opt:Option)
	{
		_options.remove(opt);
	}

	private var _name:String = "New Category";
	public final function getName() {
		return _name;
	}

	public function new (aName:String, options:Array<Option>)
	{
		_name = aName;
		_options = options;
	}
}

class Option
{
	public function new()
		{
			display = updateDisplay();
		}
		private var display:String;
		private var acceptValues:Bool = false;
		public final function getDisplay():String
		{
			return display;
		}
	
		public final function getAccept():Bool
		{
			return acceptValues;
		}

	
	public function getValue():String { return throw "stub!"; };
	
	// Returns whether the label is to be updated.
	public function press():Bool { return throw "stub!"; }
	private function updateDisplay():String { return throw "stub!"; }
	public function left():Bool { return throw "stub!"; }
	public function right():Bool { return throw "stub!"; }
}

class DFJKOption extends Option
{
	private var controls:Controls;

	public function new(controls:Controls)
	{
		super();
		this.controls = controls;
	}
	
public override function press():Bool
	{
		OptionsMenu.instance.openSubState(new KeyBindMenu());
		return false;
	}

	private override function updateDisplay():String
	{
		return "KeyBinds";
	}
}
class FPSvis extends Option
{
		public override function press():Bool
		{
			FlxG.save.data.fps = !FlxG.save.data.fps;
			(cast (Lib.current.getChildAt(0), Main)).toggleFPS(FlxG.save.data.fps);
			display = updateDisplay();
			return true;
		}
	
		private override function updateDisplay():String
		{
			return "FPS-Counter " + (!FlxG.save.data.fps ? "off" : "on");
		}
}

class GhostTaping extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.ghostTaping = !FlxG.save.data.ghostTaping;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return (!FlxG.save.data.ghostTaping ? "OldInput" : "NewInput");
	}
}

class ResetButton extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.ResetButton = !FlxG.save.data.ResetButton;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Reset-Button " + (!FlxG.save.data.ResetButton ? "off" : "on");
	}
}

class HitSound extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.hitSound = !FlxG.save.data.hitSound;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Hit-Sound " + (!FlxG.save.data.hitSound ? "off" : "on");
	}
}

class BGcharacters extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.bgShits = !FlxG.save.data.bgShits;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "BG-Characters " + (!FlxG.save.data.bgShits ? "off" : "on");
	}
}

/*class KeyBinds extends Option
{
	private var controls:Controls;

	public function new(controls:Controls)
	{
		super();
		this.controls = controls;
	}
	
	public override function press():Bool
	{
		FlxG.save.data.keyBinds = !FlxG.save.data.keyBinds;
		
		if (FlxG.save.data.keyBinds)
			controls.setKeyboardScheme(KeyboardScheme.Solo(true), true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Solo(false), true);

		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return (!FlxG.save.data.keyBinds ? "Q-W-O-P" : "A-S-K-L");
	}
}*/

class EnemyStrums extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.enemyStrums = !FlxG.save.data.enemyStrums;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Enemy-Strums " + (!FlxG.save.data.enemyStrums ? "off" : "on");
	}
}

class HudMGS extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.hud = !FlxG.save.data.hud;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Hud-Data " + (!FlxG.save.data.hud ? "off" : "on");
	}
}

class WTRMRKS extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.wtrMrks = !FlxG.save.data.wtrMrks;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Water-Marks " + (!FlxG.save.data.wtrMrks ? "off" : "on");
	}
}

class EspanishDialog extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.spanishDialogues = !FlxG.save.data.spanishDialogues;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Espanish-Dialogues " + (!FlxG.save.data.spanishDialogues ? "off" : "on");
	}
}

class MiddleScroll extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.middleScroll = !FlxG.save.data.middleScroll;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "MiddleScroll " + (!FlxG.save.data.middleScroll ? "off" : "on");
	}
}

class CirclesNotes extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.circlesNotes = !FlxG.save.data.circlesNotes;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Circles-Notes " + (!FlxG.save.data.circlesNotes ? "off" : "on");
	}
}

class ScoreTxtZoom extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.scoreZoom = !FlxG.save.data.scoreZoom;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Scoretxt-zoom " + (!FlxG.save.data.scoreZoom ? "off" : "on");
	}
}

class DaRatingComplex extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.daRatingComplex = !FlxG.save.data.daRatingComplex;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return (!FlxG.save.data.daRatingComplex ? "DaRating-simple" : "DaRating-complex");
	}
}

class HealthBarRotated extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.rotedBar = !FlxG.save.data.rotedBar;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return (!FlxG.save.data.rotedBar ? "Vanilla-HealthBar" : "StylusEngine-HealthBar");
	}

}

class FullScreen extends Option
{
	public override function press():Bool
	{
		FlxG.fullscreen = !FlxG.fullscreen;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return (!FlxG.save.data.fullscreen ? "FullScreen" : "FullScreen");
	}

}