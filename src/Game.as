package
{

import Classes.AvatarEnemy;

import starling.display.Sprite;

	public class Game extends Sprite
	{
		
		public var enemy:AvatarEnemy;
		
		public function Game() 
		{	
			enemy = new AvatarEnemy();
			addChild(enemy);
		}
	}
}