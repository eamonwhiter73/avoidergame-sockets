package 
{

	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Point;
	import flash.system.Security;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;
	
	import starling.core.Starling;
	import Classes.CustomSocket;
	
	[SWF(width="500", height="500", frameRate="30", backgroundColor="#FFFFFF")]
	public class Startup extends Sprite
	{
		private var socket:CustomSocket;
		
		private var mStarling:Starling;
		
		//Create referencable cursor image.
		[Embed(source="Classes/Avatarpic.png")]
		public const Cursor:Class;
		
		public var cursor;
		private var cursorBitmapData:BitmapData;
		private var cursorData:MouseCursorData;
		private var cursorVector:Vector.<BitmapData>;
		
		public function Startup()
		{
			Security.loadPolicyFile("xmlsocket://127.0.0.1:10843");
			
			socket = new CustomSocket("localhost", 8000);
			
			MonsterDebugger.initialize(this);
			
			mStarling = new Starling(Game, stage);
			mStarling.start();
			
			createCustomCursor(); //Create cursor
			
			// These settings are recommended to avoid problems with touch handling
			// Create a Starling instance that will run the "Game" class
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			socket.writeUTF("Game started");
			socket.flush();
		}
		
		private function createCustomCursor():void
		{	
			cursor = new Cursor();
			cursorBitmapData = new BitmapData(32, 32, true, 0x000000); //Create empty bitmapdata object.
			cursorBitmapData.draw(cursor); //draw cursor on canvas of bitmapdata object.
			
			cursorVector = new Vector.<BitmapData>();
			cursorVector[0] = cursorBitmapData; //store image in vector.
			
			cursorData = new MouseCursorData();
			cursorData.hotSpot = new Point(0, 0);
			cursorData.data = cursorVector;
			
			//Register cursors
			Mouse.registerCursor("cursor", cursorData);
			Mouse.cursor = "cursor";
			
		}
	}
}
