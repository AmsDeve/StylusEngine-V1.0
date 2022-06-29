package;

import Controls.Control;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

import flixel.FlxSubState;

using StringTools;

class ResetHighScoreSubState extends FlxSubState
{

var bg:FlxSprite;

var curSelected:Int = 0;
var hovered:Int = 0;
var alphabetArray:Array<Alphabet> = [];
var yesText:Alphabet;
var noText:Alphabet;
var onYes:Bool = false;

var song:String;
	var diff:Int;
	var week:Int;

public function new(song:String, diff:Int, week:Int = -1)
	{
        this.diff = diff;
		this.week = week;
        this.song = song;
    
        super();

        var name:String = song;
        
        bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

        FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});

        persistentUpdate = true;
        
        var tooLong:Float = (name.length > 18) ? 0.8 : 1; //Fucking Winter Horrorland
		var text:Alphabet = new Alphabet(0, 180, "reset score of", true);
		text.screenCenter(X);
		alphabetArray.push(text);
		text.alpha = 0.5;
		add(text);
		var text2:Alphabet = new Alphabet(0, text.y + 90,${name}, true, false, 0.05, tooLong);
		text2.screenCenter(X);
		if(week == -1) tooLong;
		alphabetArray.push(text2);
		text2.alpha = 0.5;
		add(text2);

		yesText = new Alphabet(0, text.y + 150, 'Yes', true);
		yesText.screenCenter(X);
		yesText.x -= 200;
		add(yesText);
		noText = new Alphabet(0, text.y + 150, 'No', true);
		noText.screenCenter(X);
		noText.x += 200;
		add(noText);
		updateOptions();
	}

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            close();
        }else if(FlxG.keys.justPressed.ENTER) {
			if(onYes) {
				if(week == -1) {
					Highscore.resetSong(song, diff);
				} else {
					//Highscore.resetWeek(week, diff);
				}
			}
			FlxG.sound.play(Paths.sound('cancelMenu'), 1);
			close();
		}

		if(FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.RIGHT) {
			FlxG.sound.play(Paths.sound('scrollMenu'), 1);
			onYes = !onYes;
			updateOptions();
		}
        super.update(elapsed);
	}

	function updateOptions() {
		var scales:Array<Float> = [0.75, 1];
		var alphas:Array<Float> = [0.6, 1.25];
		var confirmInt:Int = onYes ? 1 : 0;

		yesText.alpha = alphas[confirmInt];
		yesText.scale.set(scales[confirmInt], scales[confirmInt]);
		noText.alpha = alphas[1 - confirmInt];
		noText.scale.set(scales[1 - confirmInt], scales[1 - confirmInt]);
	}
}
		