package Classes
{
	import flash.geom.Rectangle;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.Panel;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	import feathers.events.FeathersEventType;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	
	public class Login extends Screen
	{
		private var input:TextInput;
		private var input2:TextInput;
		private var header:Header;
		private var button:Button;
		private var userinfo:Object;
			
		//Make image
		[Embed(source='submitbutton.png')]
		private static var submitbutton:Class;
		
		//Make image
		[Embed(source='login.png')]
		private static var login:Class;
		
		private var texture:Texture = Texture.fromBitmap(new submitbutton());
		private var texture2:Texture = Texture.fromBitmap(new login());
		private var panel:Panel;
		private var dispatcher:CustomDispatcher = new CustomDispatcher();
		
		public function Login()
		{
		}
		
		override protected function draw():void {
			
			input.text = "Enter username";
			input.name = "usernameinput";
			input.prompt = "USERNAME";
			input.height = 100;
			input.width = 600;
			input.x = this.width / 4;
			input.y = 150;
			
			input2.text = "Enter password";
			input2.name = "passwordinput";
			input2.prompt = "PASSWORD";
			input2.width = 600;
			input2.height = 100;
			input2.x = this.width / 4;
			input2.y = 350;
			input2.displayAsPassword = true;
			
			button.x = this.width / 2 - 200;
			button.y = 550;
			button.label = "Sign in";
			button.width = 400;
			button.height = 100;
			button.defaultSkin = new Image( texture );
			button.downSkin = new Image( texture );
			//input2.addEventListener(FeathersEventType.ENTER, entered);
		}
		
		/*private function entered(e:FeathersEventType):void {
			dispatchEventWith("enterPressed", false, {username:input.text, password: input2.text}); 
		}*/
		/*private function actionHandler(e:Event, data:String):void {
			trace(data + " " + "IN STRING FORM");
			dispatcher.doAction2(data);
		}*/
		
		override protected function initialize():void {

			//dispatcher.addEventListener(CustomDispatcher.SENDINFO, actionHandler);
			
			panel = new Panel();
			addChild(panel);
			
			panel.headerFactory = function():Header
			{
				header = new Header();
				header.width = actualWidth;
				header.backgroundSkin = new Image( texture2 );
				return header;
			}
			
			button = new Button();
			addChild(button);
			button.addEventListener( Event.TRIGGERED, button_triggeredHandler );
			
			input = new TextInput();
			addChild(input);
			
			input2 = new TextInput();
			addChild(input2);
		}
		
		private function button_triggeredHandler():void {
			trace("here");
			userinfo = input.text + " " + input2.text;
			dispatchEventWith(Event.COMPLETE, false, userinfo);
		}
		
		public function getUserInfo():Object {
			return userinfo;
		}
	}
}