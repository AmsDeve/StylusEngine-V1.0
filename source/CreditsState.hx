package;

import HealthIcon.HealthIcon;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;

class CreditsState extends MusicBeatState
{
   var creditsPpl = CoolUtil.coolTextFile(Paths.txt('creditsList')); 
   var descs = CoolUtil.coolTextFile(Paths.txt('creditsDesc'));
   var pplArray:Array<Modders> = [];
   private var groupCredits:FlxTypedGroup<Alphabet>;
   var bg:FlxSprite;
   var curSelected:Int = 0;
   private var iconArray:Array<HealthIcon> = [];
   var descBG:FlxSprite;
   var descText:FlxText;

   override function create(){
       bg = new FlxSprite().loadGraphic(Paths.image('menuBG'));
       bg.screenCenter();
       add(bg);
       /*descBG = new FlxSprite(300, 30).makeGraphic(550, 500, FlxColor.BLACK);
       descBG.screenCenter(X);
       descBG.alpha = 0.6;
       add(descBG);*/
       descText = new FlxText(FlxG.width * 0.7, 100, 0, "", 32);
       descText.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
       
    for (i in 0...creditsPpl.length)
		{
			var leCreditsPplArray:Array<String> = creditsPpl[i].split(':');
			pplArray.push(new Modders(leCreditsPplArray[0], leCreditsPplArray[1]));
		}
        groupCredits = new FlxTypedGroup<Alphabet>();
		add(groupCredits);
        for (i in 0...pplArray.length)
            {
                var pplText:Alphabet = new Alphabet(0, (70 * i) + 30, pplArray[i].modderName, true, false);
                pplText.isMenuItem = true;
				pplText.screenCenter(X);
				pplText.forceX = pplText.x;
                pplText.targetY = i;
                groupCredits.add(pplText);

                var icon:HealthIcon = new HealthIcon(pplArray[i].modderIcon);
			    icon.sprTracker = pplText;

			    iconArray.push(icon);
			    add(icon);
            }
			add(descText);
            changeSelection();
   super.create();
   }

   function changeSelection(change:Int = 0) {
    curSelected += change;
    if (curSelected < 0)
        curSelected = pplArray.length - 1;
    if (curSelected >= pplArray.length)
        curSelected = 0;

    var bullShit:Int = 0;

    for (item in groupCredits.members) {
        item.targetY = bullShit - curSelected;
        bullShit++;
        item.alpha = 0.6;
        if (item.targetY == 0) {
            item.alpha = 1;
        }
    }
    FlxG.sound.play(Paths.sound('scrollMenu'));
}

   override function update(elapsed:Float){
    if (FlxG.keys.justPressed.UP) {
        changeSelection(-1);
    }
    if (FlxG.keys.justPressed.DOWN) {
        changeSelection(1);
    }
    if(controls.BACK){
        FlxG.switchState(new MainMenuState());
    }
    if(controls.ACCEPT){
        switch(curSelected)
            {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
    }
}
   super.update(elapsed);
   descText.text = descs[curSelected].toUpperCase();
}
}
class Modders
{
	public var modderName:String = "";
	public var modderIcon:String = "";

	public function new(name:String, modderIcon:String)
	{
		this.modderName = name;
		this.modderIcon = modderIcon;
	}
}