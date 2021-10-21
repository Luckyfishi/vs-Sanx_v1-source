package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = FlxG.save.data.antialiasing;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('GF_assets','shared',true);
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);
				animation.addByPrefix('stop', 'GFstop', 48, false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-sanx':
				tex = Paths.getSparrowAtlas('GF_assets','shared',true);
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);
				animation.addByPrefix('stop', 'GFstop', 48, false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'bf':
				var tex = Paths.getSparrowAtlas('BOYFRIEND','shared',true);
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, false);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);
				animation.addByPrefix('hit', 'BF hit', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'sanx-pixel':
				var tex = Paths.getSparrowAtlas('characters/SANXpixels', 'shared');
				frames = tex;

				animation.addByPrefix('idle', 'Sanx idle dance', 24, false);
				animation.addByPrefix('singUP', 'Sanx NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'Sanx NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'Sanx NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'Sanx NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'Sanx NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Sanx NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Sanx NOTERIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Sanx NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "Sanx dies", 24, false);
				animation.addByPrefix('deathLoop', "Sanx Dead confirm", 24, false);
				animation.addByPrefix('deathConfirm', "Sanx Dead Loop", 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;

				playAnim('idle');

				flipX = true;

			case 'sanx':
				tex = Paths.getSparrowAtlas('characters/Sanx_sprites');
				frames = tex;
				animation.addByPrefix('idle', 'sanxdance', 24, false);
				animation.addByPrefix('singUP', 'sanxup', 24, false);
				animation.addByPrefix('singRIGHT', 'sanxright', 24, false);
				animation.addByPrefix('singDOWN', 'sanxdown', 24, false);
				animation.addByPrefix('singLEFT', 'sanxleft', 24, false);

				animation.addByPrefix('smile', 'sanxchu', 24, false);
				animation.addByPrefix('scare', 'sanxstop', 24, false);	
				animation.addByPrefix('fear', 'sanxfear', 14, false);	
				
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'puki':
				tex = Paths.getSparrowAtlas('characters/pukiki');
				frames = tex;
				animation.addByPrefix('idle', 'pukidance', 24, false);
				animation.addByPrefix('singUP', 'pukiup', 24, false);
				animation.addByPrefix('singRIGHT', 'pukiright', 24, false);
				animation.addByPrefix('singDOWN', 'pukidown', 24, false);
				animation.addByPrefix('singLEFT', 'pukileft', 24, false);

				animation.addByPrefix('release', 'pukiwakalana', 24, false);

				loadOffsetFile(curCharacter);
	
				playAnim('idle');
			
			case 'simon':
				tex = Paths.getSparrowAtlas('characters/SimonSprites');
				frames = tex;
				animation.addByPrefix('idle', 'Simondance', 24, false);
				animation.addByPrefix('singUP', 'Simonup', 24, false);
				animation.addByPrefix('singRIGHT', 'Simonright', 24, false);
				animation.addByPrefix('singDOWN', 'Simondown', 24, false);
				animation.addByPrefix('singLEFT', 'Simonleft', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;

				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf') && curCharacter!= 'sanx-pixel')
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	public function loadOffsetFile(character:String, library:String = 'shared')
	{
		var offset:Array<String> = CoolUtil.coolTextFile(Paths.txt('images/characters/' + character + "Offsets", library));

		for (i in 0...offset.length)
		{
			var data:Array<String> = offset[i].split(' ');
			addOffset(data[0], Std.parseInt(data[1]), Std.parseInt(data[2]));
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf') && curCharacter!= 'sanx-pixel')
		{
			if (animation.curAnim.name.startsWith('sing') || animation.curAnim.name =='smile' || animation.curAnim.name == 'scare'
				|| animation.curAnim.name == 'release')
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;

			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if ((animation.curAnim.name == 'hairFall' || animation.curAnim.name == 'stop') && animation.curAnim.finished)
					playAnim('danceRight');
			case 'sanx':
				if ((animation.curAnim.name == 'smile' || animation.curAnim.name == 'scare') && animation.curAnim.finished)
					playAnim('idle', true);
			case 'puki':
				if (animation.curAnim.name == 'release' && animation.curAnim.finished)
					playAnim('idle', true);
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance(forced:Bool = false, altAnim:Bool = false)
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf' | 'gf-sanx':
					if (!animation.curAnim.name.startsWith('hair') && animation.curAnim.name !='stop')
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'sanx':
					if (animation.curAnim.name !='smile' && animation.curAnim.name !='scare')	
					{
						playAnim('idle', forced);
					}
				case 'puki':
					if (animation.curAnim.name !='release')	
						{
							playAnim('idle', forced);
						}
			
				default:
					if (altAnim && animation.getByName('idle-alt') != null)
						playAnim('idle-alt', forced);
					else
						playAnim('idle', forced);
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{

		if (AnimName.endsWith('alt') && animation.getByName(AnimName) == null)
		{
			#if debug
			FlxG.log.warn(['Such alt animation doesnt exist: ' + AnimName]);
			#end
			AnimName = AnimName.split('-')[0];
		}

		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
