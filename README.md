# Stylus Engine

![FnF logo](art/thumbnailNewer.png)

# If you want to contribute in Stylus Engine, read [this](art/README.md).

# Discord
- Ams Community **[![DiscordOf](https://img.shields.io/discord/778038568680554497?label=discord)](https://discord.gg/TGs8jBTBux)**
- MDC **[![DiscordMDC](https://img.shields.io/discord/778038568680554497?label=discord)](https://discord.gg/Aw4dzGRC)**

# Compiling

- `lime test windows`
- `lime test windows -debug`
- `lime test html`
- `lime test html -debug`


# Desc

This is the Engine for Friday Night Funkin, game made by  [NinjaMuffin99](https://twitter.com/ninja_muffin99) 

Play the original game in:https://www.newgrounds.com/portal/view/770371

**IF YOU MAKE A MOD IN THIS ENGINE, OPEN THE SOURCE CODE IF YOUR MOD AS WELL**

# Credits
- [AmsDev](https://twitter.com/AmsDev2) - Programmer & Engine Creator
- [AndyGamer](https://twitter.com/AndyGamer1116YT) - Icon artist

# Bugs

**If you have some problems contact me in mi oficial server
You can also ask the server moderators for help** [Here](#discord)

# Libs you need to install

- `haxelib git polymod https://github.com/PabloelproxD210/Polymod`
- `haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc`
- `haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons`
- `haxelib git extension-webm https://github.com/KadeDev/extension-webm`
- `haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit`
- `haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit.git`

Oh and thx(fuck u) MDC for passing me the libs :]

![FUCK U](art/readme/fckUmdc.PNG)

# Previews

![MENU](art/readme/Menu.PNG)

![OPTIONS](art/readme/Options.PNG)

![FREEPLAY](art/readme/Freeplay.PNG)

![CHARTING MENU](art/readme/ChartingMenu.PNG)

![GAMEPLAY](art/readme/Gameplay.PNG)

## Enjoy!

Thx for download the engine have fun!!!!

# Friday Night Funkin

This is the repository for Friday Night Funkin, a game originally made for Ludum Dare 47 "Stuck In a Loop".

Play the Ludum Dare prototype here: https://ninja-muffin24.itch.io/friday-night-funkin
Play the Newgrounds one here: https://www.newgrounds.com/portal/view/770371
Support the project on the itch.io page: https://ninja-muffin24.itch.io/funkin

IF YOU MAKE A MOD AND DISTRIBUTE A MODIFIED / RECOMPILED VERSION, YOU MUST OPEN SOURCE YOUR MOD AS WELL

## Credits / shoutouts

- [ninjamuffin99 (me!)](https://twitter.com/ninja_muffin99) - Programmer
- [PhantomArcade3K](https://twitter.com/phantomarcade3k) and [Evilsk8r](https://twitter.com/evilsk8r) - Art
- [Kawaisprite](https://twitter.com/kawaisprite) - Musician

This game was made with love to Newgrounds and its community. Extra love to Tom Fulp.

### Installing the Required Programs

First, you need to install Haxe and HaxeFlixel. I'm too lazy to write and keep updated with that setup (which is pretty simple). 
1. [Install Haxe 4.1.5](https://haxe.org/download/version/4.1.5/) (Download 4.1.5 instead of 4.2.0 because 4.2.0 is broken and is not working with gits properly...)
2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe

Other installations you'd need are the additional libraries, a fully updated list will be in `Project.xml` in the project root. Currently, these are all of the things you need to install:
```
flixel
flixel-addons
flixel-ui
hscript
newgrounds
```
So for each of those type `haxelib install [library]` so shit like `haxelib install newgrounds`

### Ignored files

There is no ignored files, all are already fixxed xd

### Compiling game
NOTE: If you see any messages relating to deprecated packages, ignore them. They're just warnings that don't affect compiling

Once you have all those installed, it's pretty easy to compile the game. You just need to run `lime test html5 -debug` in the root of the project to build and run the HTML5 version. (command prompt navigation guide can be found here: [https://ninjamuffin99.newgrounds.com/news/post/1090480](https://ninjamuffin99.newgrounds.com/news/post/1090480))

### Additional guides

- [Command line basics](https://ninjamuffin99.newgrounds.com/news/post/1090480)
