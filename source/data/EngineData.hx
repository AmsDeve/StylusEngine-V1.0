package data;

import flixel.input.gamepad.FlxGamepad;
import flixel.FlxState;
import flixel.FlxG;

using StringTools;

class EngineData extends MusicBeatState
{
public static var version = '${NGio.GAME_VER}';

public static var DataGit = 'github.com';

public static var author = 'AmsDev';

public static var contributors = '${author}';

public static var funkinTeam = '${NGio.funkinCrew}';

public static function initSave()
    {
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		
		KeyBinds.gamepad = gamepad != null;

		PlayerSettings.player1.controls.loadKeyBinds();
		KeyBinds.keyCheck();

	}

    override function create()
        {
            FlxG.save.bind('StylusEngine', 'AmsDev');
        }
}

