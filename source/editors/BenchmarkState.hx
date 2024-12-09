package editors;

import flixel.FlxG;
import flixel.FlxState;
import model.objects.flixel.Flixel;

class BenchmarkState extends FlxState
{
	var daFlixelLogo:Flixel;

	//this is so its actually possible to leave the state
	private var controls(get, never):Controls;
	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	override public function create()
	{
		super.create();

		daFlixelLogo = new Flixel();
		add(daFlixelLogo);
	}

	override function destroy()
	{
		if (daFlixelLogo != null) daFlixelLogo.destroy();
		super.destroy();
	}
	override function update(elapsed:Float)
	{
		if(controls.BACK)
		{
			FlxG.switchState(new MasterEditorMenu());
			FlxG.sound.playMusic(Paths.music('freakyMenu-' + ClientPrefs.daMenuMusic));
		}
		super.update(elapsed);
	}
}
