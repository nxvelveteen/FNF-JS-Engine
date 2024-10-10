package;

import flixel.input.keyboard.FlxKey;

#if VIDEOS_ALLOWED
#if (hxCodec >= "3.0.0" || hxCodec == "git")
import hxcodec.flixel.FlxVideo as MP4Handler;
#elseif (hxCodec == "2.6.1")
import hxcodec.VideoHandler as MP4Handler;
#elseif (hxCodec == "2.6.0")
import VideoHandler as MP4Handler;
#else
import vlc.MP4Handler;
#end
#end

class StartupState extends MusicBeatState
{
	var logo:FlxSprite;
	var skipTxt:FlxText;

	var maxIntros:Int = 2;

	override public function create():Void
	{
		#if VIDEOS_ALLOWED maxIntros += 1; #end
		var theIntro:Int = FlxG.random.int(0, maxIntros);
		FlxTransitionableState.skipNextTransIn = true;
		FlxTransitionableState.skipNextTransOut = true;
		logo = new FlxSprite().loadGraphic(Paths.image('sillyLogo', 'splash'));
		logo.scrollFactor.set();
		logo.screenCenter();
		logo.alpha = 0;
		logo.active = true;
		add(logo);

		skipTxt = new FlxText(0, FlxG.height, 0, '${mobile.MobileControls.enabled ? 'Touch Your Screen' : 'Press ENTER'} To Skip', 16);
		skipTxt.setFormat("Comic Sans MS Bold", 18, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		skipTxt.borderSize = 1.5;
		skipTxt.antialiasing = true;
		skipTxt.scrollFactor.set();
		skipTxt.alpha = 0;
		skipTxt.y -= skipTxt.textField.textHeight;
		add(skipTxt);

		FlxTween.tween(skipTxt, {alpha: 1}, 1);

		new FlxTimer().start(0.1, function(tmr:FlxTimer) {
			switch (theIntro) {
				case 0:
					FlxG.sound.play(Paths.sound('startup', 'splash'));
					logo.scale.set(0.1,0.1);
					logo.updateHitbox();
					logo.screenCenter();
					FlxTween.tween(logo, {alpha: 1, "scale.x": 1, "scale.y": 1}, 0.95, {ease: FlxEase.expoOut, onComplete: _ -> onIntroDone()});
				case 1:
					FlxG.sound.play(Paths.sound('startup', 'splash'));
					FlxG.sound.play(Paths.sound('FIREINTHEHOLE', 'splash'));
					logo.loadGraphic(Paths.image('lobotomy', 'splash'));
					logo.scale.set(0.1,0.1);
					logo.updateHitbox();
					logo.screenCenter();
					FlxTween.tween(logo, {alpha: 1, "scale.x": 1, "scale.y": 1}, 1.35, {ease: FlxEase.expoOut, onComplete: _ -> onIntroDone()});
				case 2:
					FlxG.sound.play(Paths.sound('screwedEngine', 'splash'));
					logo.loadGraphic(Paths.image('ScrewedLogo', 'splash'));
					logo.scale.set(0.1,0.1);
					logo.updateHitbox();
					logo.screenCenter();
					FlxTween.tween(logo, {alpha: 1, "scale.x": 1, "scale.y": 1}, 1.35, {ease: FlxEase.expoOut, onComplete: _ -> onIntroDone(0.6)});
				case 3:
					#if VIDEOS_ALLOWED
						var vidSprite = new MP4Handler(); // it plays but it doesn't show???
						#if (hxCodec < "3.0.0")
						vidSprite.playVideo(Paths.video('bambiStartup'), false, false);
						vidSprite.finishCallback = function()
						{
							FlxG.switchState(TitleState.new);
						};
						#else
						vidSprite.play(Paths.video('bambiStartup'));
						vidSprite.onEndReached.add(function(){
							vidSprite.dispose();
							FlxG.switchState(TitleState.new);
						});
						#end
					#end
			}
		});

		super.create();
	}

	function onIntroDone(?fadeDelay:Float = 0) {
		FlxTween.tween(logo, {alpha: 0}, 1, {
			startDelay: fadeDelay,
			ease: FlxEase.linear,
			onComplete: function(_) {
				FlxG.switchState(TitleState.new);
			}
		});
	}

	override function update(elapsed:Float)
	{
		var justTouched:Bool = false;
		for (touch in FlxG.touches.list)
			if (touch.justPressed)
				justTouched = true;

		if (justTouched || FlxG.keys.justPressed.ENTER) FlxG.switchState(TitleState.new);
		super.update(elapsed);
	}
}
