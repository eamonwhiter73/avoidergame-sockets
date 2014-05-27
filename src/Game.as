package
{

import com.gamua.flox.Player;

import flash.geom.Point;

import Classes.CustomDispatcher;
import Classes.EmbeddedAssets;
import Classes.GameScreen;
import Classes.Login;
import Classes.Password;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.controls.TextInput;
import feathers.events.FeathersEventType;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
import starling.utils.AssetManager;

	public class Game extends Sprite
	{	
		public var img:Image;
		public var img2:Image;
		private var paused2:Boolean = false;
		private var counter:int = 0;
		private var currentPlayer:Player;
		private var nav:ScreenNavigator = new ScreenNavigator();
		private var nav2:ScreenNavigator = new ScreenNavigator();
		private var userinfo:String;
		
		private static const LOGIN:String = "login";
		private static const GAME:String = "game";
		private static const SUBMIT:String = "submit";
		private static const PW:String = "password";
		
		private var remove:Boolean = false;
		
		//private var userinput:ScreenNavigatorItem = new ScreenNavigatorItem(new Login, {complete: filledinuser});
		//var userpw:ScreenNavigatorItem = new ScreenNavigatorItem(new Password, null);
		//private var game:ScreenNavigatorItem = new ScreenNavigatorItem(new GameScreen/*, {added: redo}*/);
		
		public function Game() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init():void {
			
			addChild(nav);
			//addChild(nav2);
			nav.addScreen(LOGIN, new ScreenNavigatorItem(new Login, {complete: filledinuser}));
			nav.addScreen(GAME, new ScreenNavigatorItem(new GameScreen/*, {added: redo}*/));
			nav.showScreen(LOGIN);
		}
		
		public function getIsOver():Boolean {
			return paused2;
		}
		
		/*private function redo():void {
			if(remove) {
				nav.removeScreen(LOGIN);
			}
		}*/
		
		private function filledinuser(e:Event, data:String):void {
			remove = true;
			trace("in filledinuser function" + " " + data);
			userinfo = data;
			this.dispatchEventWith(Event.COMPLETE, true, userinfo);
			trace(userinfo);
			nav.clearScreen();
			nav.showScreen(GAME);
		}
		
		public function getUserInfo():String {
			return userinfo;
		}
		
		public function getScore():int {
			return counter;
		}
	}
}