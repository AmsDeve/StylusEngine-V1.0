package;

import flixel.addons.ui.FlxUI.MaxMinSize;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

using StringTools;

class MainMenuState extends MusicBeatState
{

	var hovered:Float = 0;

	var curSelected:Int = 0;

	var v = '${data.EngineData.version}';

	var menuItems:FlxTypedGroup<FlxSprite>;

	var optionShit:Array<String> = [
	'story mode',
	'freeplay',
	'options'
	#if FUNKIN_CREW
	'donate'
	#end
];
/*     _    _          _____       _____      _    _
     | |  | |       /  __  \    /  __   \   | \__/ \    X  X   DDD
     | |  | |       | |  |_|   |  |__|  |   |      |    X  X   D  D
     | |  | |       | | ____   |   __   |   \_   _/       X    D   D
     | |__| |       | ||__  \  |  |  |  |     |_|       X  X   D  D
     \_____/        \_______|  |__|  |__|     |_|       X  X   DDD      */


	var magenta:FlxSprite;
	var camFollow:FlxObject;

	override function create()
	{
		
		FlxG.mouse.visible = true;

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		Conductor.changeBPM(210);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.18;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('menu/FNF_main_menu_assets', 'shared');

		for (i in 0...optionShit/*uMOM*/.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, 20 + (i * 250));
			menuItem.frames = tex;
				menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
				menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
				menuItem.animation.play('idle');
				menuItem.ID = i;
				menuItem.scrollFactor.set();
				menuItem.antialiasing = true;
				menuItems.add(menuItem);
			if (menuItem.ID == 4)
				menuItem.y -= 30;
			

			menuItem.x -= 500;
			menuItem.alpha = 0;

			FlxTween.tween(menuItem, {alpha: 1, x: menuItem.x + 500}, 0.7, {startDelay: 0.3 * i, ease: FlxEase.smoothStepOut});
		}

		FlxG.camera.follow(camFollow, null, 0.00);

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, 'Player Name: ${userName()}', 22);
		var version2Shit:FlxText = new FlxText(5, FlxG.height - 18, 0, 'Version: ${v}', 22);
		versionShit.scrollFactor.set();
		versionShit.y -= 15;
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		version2Shit.scrollFactor.set();
		version2Shit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(version2Shit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			
			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.ACCEPT /*mouse shit || FlxG.mouse.justPressed*/)
			{
				if (optionShit[curSelected] == '')
				{
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								/*switch (hovered)
								{
									case 0:
										FlxG.switchState(new StoryMenuState());
									case 1:
mouse shit         						FlxG.switchState(new FreeplayState());
									case 2:
										FlxG.switchState(new OptionsMenu());
								}*/

								switch (daChoice)
								{
									case 'story mode':
										FlxG.switchState(new StoryMenuState());
									case 'freeplay':
										FlxG.switchState(new FreeplayState());
									case 'options':
										FlxG.switchState(new OptionsMenu());
								}
							});
						}
					});
				}
			}
		}

		

		super.update(elapsed);

		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, 0.95);
		if (FlxG.sound.music != null){
			Conductor.songPosition = FlxG.sound.music.time;
		}

		menuItems.forEach(function(spr:FlxSprite)
		{
			/*if (FlxG.mouse.overlaps(spr))
				hovered = (spr.ID);
							if (spr.ID == (hovered))
mouse shit 						spr.animation.play('selected');
							else
								spr.animation.play('idle');*/
		});
	}

	override function beatHit(){
		super.beatHit();
		if((curBeat % 4 == 0 || curBeat % 4 == 2) && FlxG.camera.zoom < 1.35){
			FlxG.camera.zoom += 0.035;
	}
	if(curBeat == lastBeat - 1 && curBeat == 0){
      FlxG.camera.zoom += 0.035;
	  FlxG.camera.flash(FlxColor.WHITE, 2);

	}
}

	function userName():String {
		#if sys
		var env = Sys.environment();
		if (!env.exists("USERNAME")) {
			return "Couldnt find computa name";
		}
		return env["USERNAME"];
		#else
		return "Player";
		#end
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected)
				if (spr.ID == curSelected)
					{
						spr.animation.play('selected');
						camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
					}

			spr.updateHitbox();
		});
	}
}