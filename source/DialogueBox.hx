package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';
	var curAnim:String = '';
	var curBG:String = '';

	var canskip:Bool = false;

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;
	var skiptext:FlxTypeText;

	public var finishThing:Void->Void;

	var CG:FlxSprite;
	var portraitsanx:FlxSprite;
	var portraitpuki:FlxSprite;
	var portraitBF:FlxSprite;
	var portraitGF:FlxSprite;
	var portraitCouple:FlxSprite;
	var portraitR:FlxSprite;
	var portraitkurono:FlxSprite;
	var portraitsanxbar:FlxSprite;
	var portraitsimon:FlxSprite;
	var pe:FlxSprite;
	var end1:FlxSprite;

	var bgFade:FlxSprite;
	var bgBlack:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				canskip = true;
			});

		bgFade = new FlxSprite(-400, -400).makeGraphic(Std.int(FlxG.width * 1.8), Std.int(FlxG.height * 1.8), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		bgBlack= new FlxSprite(-1000, -400).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		bgBlack.scrollFactor.set();
		add(bgBlack);

		//remove(PlayState.black);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				hasDialog = true;
				box = new FlxSprite(0, 310);
				box.frames = Paths.getSparrowAtlas('dialogueBox-sanx');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;

		CG = new FlxSprite(0, 0);
		CG.frames = Paths.getSparrowAtlas('cutscene/PlotCG','sanxweek');
		for (i in 1...7)
			{
				CG.animation.addByPrefix('CG'+ i, 'CG' + i, 24, false);
			}
		CG.animation.addByPrefix('black', 'black', 24, false);
		CG.antialiasing = FlxG.save.data.antialiasing;
		CG.screenCenter(X);
		CG.updateHitbox();
		CG.scrollFactor.set();
		add(CG);
		CG.alpha = 0;
		
		portraitsanx = new FlxSprite(160, 30);
		portraitsanx.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		for (i in 1...8)
			{
				portraitsanx.animation.addByPrefix('sanx'+ i, 'sanx' + i, 24, false);
			}
		portraitsanx.antialiasing = FlxG.save.data.antialiasing;
		portraitsanx.updateHitbox();
		portraitsanx.scrollFactor.set();
		add(portraitsanx);
		portraitsanx.visible = false;

		portraitpuki = new FlxSprite(160, 30);
		portraitpuki.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		for (i in 1...5)
			{
				portraitpuki.animation.addByPrefix('puki'+ i, 'puki' + i, 24, false);
			}
		portraitpuki.antialiasing = FlxG.save.data.antialiasing;
		portraitpuki.updateHitbox();
		portraitpuki.scrollFactor.set();
		add(portraitpuki);
		portraitpuki.visible = false;

		portraitBF = new FlxSprite(800, 25);
		portraitBF.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		for (i in 2...10)
			{
				portraitBF.animation.addByPrefix('BF'+ i, 'BF' + i, 24, false);
			}
		portraitBF.animation.addByPrefix('BF1', 'BF100001', 24, false);
		portraitBF.animation.addByPrefix('BF10', 'BF100000', 24, false);
		portraitBF.animation.addByPrefix('BF11', 'BF11', 24, false);
		portraitBF.antialiasing = FlxG.save.data.antialiasing;
		portraitBF.updateHitbox();
		portraitBF.scrollFactor.set();
		add(portraitBF);
		portraitBF.visible = false;

		portraitGF = new FlxSprite(800, 25);
		portraitGF.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		for (i in 1...9)
			{
				portraitGF.animation.addByPrefix('GF'+ i, 'GF' + i, 24, false);
			}
		portraitGF.antialiasing = FlxG.save.data.antialiasing;
		portraitGF.updateHitbox();
		portraitGF.scrollFactor.set();
		add(portraitGF);
		portraitGF.visible = false;

		portraitCouple = new FlxSprite(780, 25);
		portraitCouple.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		portraitCouple.animation.addByPrefix('Couple1', 'BG1', 24, false);	
		portraitCouple.animation.addByPrefix('Couple2', 'BG2', 24, false);	
		portraitCouple.antialiasing = FlxG.save.data.antialiasing;
		portraitCouple.updateHitbox();
		portraitCouple.scrollFactor.set();
		add(portraitCouple);
		portraitCouple.visible = false;
		
		portraitR = new FlxSprite(780, 25);
		portraitR.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		portraitR.animation.addByPrefix('R1', 'R', 24, false);		
		portraitR.antialiasing = FlxG.save.data.antialiasing;
		portraitR.updateHitbox();
		portraitR.scrollFactor.set();
		portraitR.animation.play('R1');
		add(portraitR);
		portraitR.visible = false;

		portraitkurono = new FlxSprite(780, 25);
		portraitkurono.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		portraitkurono.animation.addByPrefix('kurono1', 'kurono', 24, false);		
		portraitkurono.antialiasing = FlxG.save.data.antialiasing;
		portraitkurono.updateHitbox();
		portraitkurono.scrollFactor.set();
		portraitkurono.animation.play('kurono1');
		add(portraitkurono);
		portraitkurono.visible = false;

		portraitsanxbar = new FlxSprite(900, 400);
		portraitsanxbar.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		portraitsanxbar.animation.addByPrefix('sanxbar8', 'SANX8', 24, false);	
		portraitsanxbar.animation.addByPrefix('sanxbar9', 'SANX9', 24, false);	
		portraitsanxbar.antialiasing = FlxG.save.data.antialiasing;
		portraitsanxbar.setGraphicSize(Std.int(portraitsanxbar.width * 0.8));
		portraitsanxbar.updateHitbox();
		portraitsanxbar.scrollFactor.set();
		portraitsanxbar.visible = false;

		portraitsimon = new FlxSprite(50, 400);
		portraitsimon.frames = Paths.getSparrowAtlas('portrait/Avatar','sanxweek');
		for (i in 1...5)
			{
				portraitsimon.animation.addByPrefix('simon'+ i, 'SIMON' + i, 24, false);
			}
		portraitsimon.antialiasing = FlxG.save.data.antialiasing;
		portraitsimon.setGraphicSize(Std.int(portraitsimon.width * 0.8));
		portraitsimon.updateHitbox();
		portraitsimon.scrollFactor.set();
		portraitsimon.visible = false;
		
		box.screenCenter(X);
		add(box);
		box.animation.play('normalOpen');
		box.visible = false;

		add(portraitsanxbar);
		add(portraitsimon);

		pe = new FlxSprite(0, 0).loadGraphic(Paths.image('endings/Perfect ending','sanxweek'));
		pe.antialiasing = FlxG.save.data.antialiasing;
		pe.screenCenter(X);
		pe.updateHitbox();
		add(pe);
		pe.alpha = 0;
		
		end1 = new FlxSprite(0, 0).loadGraphic(Paths.image('endings/END1','sanxweek'));
		end1.antialiasing = FlxG.save.data.antialiasing;
		end1.screenCenter(X);
		end1.updateHitbox();
		add(end1);
		end1.alpha = 0;

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		swagDialogue = new FlxTypeText(260, 400, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.setFormat("assets/fonts/FZCHSJW.TTF", swagDialogue.size);
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		skiptext = new FlxTypeText(1040, 0, Std.int(FlxG.width * 0.6), "", 20);
		skiptext.setFormat("assets/fonts/vcr.ttf", skiptext.size);
		skiptext.color = 0xFF3F2021;
		skiptext.prefix = 'Press SPACE to skip';
		skiptext.alpha = 0;
		add(skiptext);
		FlxTween.tween(skiptext, {alpha: 1}, 1);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.SPACE && canskip)
		{
			finishThing();
			kill();
		}


		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
						{
							box.alpha -= 1 / 5;
							pe.alpha -= 1 / 5;
							end1.alpha -= 1 / 5;
							bgFade.alpha -= 1 / 5 * 0.7;
							portraitsanx.visible = false;
							portraitpuki.visible = false;
							portraitBF.visible = false;
							portraitGF.visible = false;
							portraitCouple.visible = false;
							portraitR.visible = false;
							portraitkurono.visible = false;
							portraitsanxbar.visible = false;
							portraitsimon.visible = false;
							swagDialogue.alpha -= 1 / 5;
							skiptext.alpha -= 1 / 5;
						}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'sanx':
				if (!portraitsanx.visible)
				{
					portraitsanx.visible = true;
				}
				switch(curAnim)
				{
					case "1":
						portraitsanx.animation.play('sanx1');
					case "2":
						portraitsanx.animation.play('sanx2');
					case "3":
						portraitsanx.animation.play('sanx3');
					case "4":
						portraitsanx.animation.play('sanx4');	
					case "5":
						portraitsanx.animation.play('sanx5');	
					case "6":
						portraitsanx.animation.play('sanx6');	
					case "7":
						portraitsanx.animation.play('sanx7');					
				}
			case 'puki':
				if (!portraitpuki.visible)
				{
					portraitpuki.visible = true;
				}
				switch(curAnim)
				{
					case "1":
						portraitpuki.animation.play('puki1');
					case "2":
						portraitpuki.animation.play('puki2');
					case "3":
						portraitpuki.animation.play('puki3');	
					case "4":
						portraitpuki.animation.play('puki4');
						box.visible = true;			
						remove(PlayState.dad);		
				}
			case 'bf':
				if (!portraitBF.visible)
				{
					portraitBF.visible = true;
				}
				switch(curAnim)
				{
					case "1":
						portraitBF.animation.play('BF1');
					case "2":
						portraitBF.animation.play('BF2');
					case "3":
						portraitBF.animation.play('BF3');
					case "4":
						portraitBF.animation.play('BF4');	
					case "5":
						portraitBF.animation.play('BF5');
					case "6":
						portraitBF.animation.play('BF6');
					case "7":
						portraitBF.animation.play('BF7');
					case "8":
						portraitBF.animation.play('BF8');
					case "9":
						portraitBF.animation.play('BF9');
					case "10":
						portraitBF.animation.play('BF10');
					case "11":
						portraitBF.animation.play('BF11');					
				}
			case 'gf':
				if (!portraitGF.visible)
				{
					portraitGF.visible = true;
				}
				switch(curAnim)
				{
					case "1":
						portraitGF.animation.play('GF1');
					case "2":
						portraitGF.animation.play('GF2');
					case "3":
						portraitGF.animation.play('GF3');
					case "4":
						portraitGF.animation.play('GF4');	
					case "5":
						portraitGF.animation.play('GF5');
					case "6":
						portraitGF.animation.play('GF6');
					case "7":
						portraitGF.animation.play('GF7');	
					case "8":
						portraitGF.animation.play('GF8');						
				}
			case 'couple':
				if (!portraitCouple.visible)
				{
					portraitCouple.visible = true;
				}
				switch(curAnim)
				{
					case "1":
						portraitCouple.animation.play('Couple1');
					case "2":
						portraitCouple.animation.play('Couple2');					
				}
			case 'r':
				if (!portraitR.visible)
					portraitR.visible = true;
			case 'kurono':
				if (!portraitkurono.visible)
					portraitkurono.visible = true;
			case 'sanx-bar':
				if (!portraitsanxbar.visible)
				{
					portraitsanxbar.visible = true;
				}
				switch(curAnim)
				{
					case "8":
						portraitsanxbar.animation.play('sanxbar8');
					case "9":
						portraitsanxbar.animation.play('sanxbar9');			
				}
			case 'simon':
				if (!portraitsimon.visible)
				{
					portraitsimon.visible = true;
				}
				switch(curAnim)
				{
					case "1":
						portraitsimon.animation.play('simon1');
					case "2":
						portraitsimon.animation.play('simon2');
					case "3":
						portraitsimon.animation.play('simon3');
					case "4":
						portraitsimon.animation.play('simon4');					
				}
			case 'end':
			{
				box.visible = false;
				switch(curAnim)
				{
					case 'p':
					{		
						FlxTween.tween(CG, {alpha: 0}, 1);				
						new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							FlxTween.tween(pe, {alpha: 1}, 0.5);	
							remove(CG);
						});
					}
					case '1':
					{
						if (end1.alpha == 0)
							FlxTween.tween(end1, {alpha: 1}, 1);
						bgBlack.alpha = 1;
					}	
				}
			}	
			case 'CG':
				if (CG.alpha == 0)
				{
					if (curAnim == 'black')
						CG.alpha = 1;
					else
						FlxTween.tween(CG, {alpha: 1}, 1);
				}
				switch(curAnim)
				{
					case "1":
						CG.animation.play('CG1');
					case "2":
						CG.animation.play('CG2');
					case "3":
						CG.animation.play('CG3');
					case "4":
						CG.animation.play('CG4');			
					case "5":
						CG.animation.play('CG5');
					case "6":
						CG.animation.play('CG6');
						box.visible = false;	
					case "black":
						CG.animation.play('black');		
					case "nope":
						FlxTween.tween(CG, {alpha: 0}, 1);					
				}		
		}
		switch (curBG)
		{
			case 'boxopen':
				box.visible = true;
				box.animation.play('normalOpen');
			case 'boxclose':
				box.visible = false;
			case 'OpenTheDoor':
				box.visible = false;
				FlxG.sound.play(Paths.sound('OpenTheDoor'));
			case 'Lightning':
				box.visible = false;
				FlxG.sound.play(Paths.sound('Lightning'));
			case 'boxopen&bgfade':
				box.visible = true;
				box.animation.play('normalOpen');
				remove(CG);
				FlxTween.tween(bgBlack, {alpha: 0}, 0.5);
			case 'chain':
				bgBlack.alpha = 1;
				box.visible = false;
				FlxG.sound.play(Paths.sound('chain'));
			case 'ca':
				box.visible = false;
				FlxG.sound.play(Paths.sound('ca'));
			case 'fade':
				bgBlack.visible = false;
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{FlxTween.tween(portraitpuki, {alpha: 0}, 1);	});
			case 'endfade':
				FlxTween.tween(pe, {alpha: 0}, 1);	
			case 'bgfade':
				bgBlack.alpha = 0;
				box.visible = true;
				box.animation.play('normalOpen');
			case 'cgfade':
				FlxTween.tween(CG, {alpha: 0}, 0.5);
				
		}
	}

	function cleanDialog():Void
	{
		portraitsanx.visible = false;
		portraitpuki.visible = false;
		portraitBF.visible = false;
		portraitGF.visible = false;
		portraitCouple.visible = false;
		portraitR.visible = false;
		portraitkurono.visible = false;
		portraitsanxbar.visible = false;
		portraitsimon.visible = false;

		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		curAnim = splitName[2];
		curBG = splitName[3];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + splitName[2].length + splitName[3].length + 4).trim();
	}
}
