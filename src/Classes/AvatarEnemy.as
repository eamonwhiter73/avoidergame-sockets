package Classes
{	
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.net.XMLSocket;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class AvatarEnemy extends Sprite
	{
		
		//Make image
		[Embed(source='Enemypic.png')]
		private static var Enemypic:Class;
		
		private var texture:Texture = Texture.fromBitmap(new Enemypic());
		
		private var image:Image = new Image(texture);
		
		private var paused:Boolean;
		
		private var counter:int = 0;
		
		public function AvatarEnemy() 
		{	
			image.x = 220;
			image.y = 220;
			
			image.addEventListener(TouchEvent.TOUCH, onTouch); //On touch of this image, do onTouch
			
			addChild(image);
		}
		
		//The pausing is implemented by the boolean paused variable - it controls the flow.
		private function onTouch(e:TouchEvent):void
		{
			counter++;
			if (paused) {
				return;
			}
			
			var touch:Touch = e.getTouch(this, TouchPhase.HOVER);
			if (touch.phase == TouchPhase.HOVER && !paused) {
				MonsterDebugger.trace(this, "Image touched, game over :("); 
				stage.color = 0xff0000;
				paused = true;
			} else {
				paused = false;
			}
		}
	}
}
