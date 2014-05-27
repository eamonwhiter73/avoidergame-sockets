package Classes
{
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	import feathers.events.FeathersEventType;
	
	public class Password extends Screen
	{
		private var input:TextInput;
		private var input2:TextInput;
		
		public function Password()
		{
		}
		
		override protected function draw():void {
			input.text = "Enter password";
			input.name = "usernamepassword";
			input.prompt = "PASSWORD";
			input.maxHeight = 50;
			input.width = 300;
			input.height = 50;
			input.x = 100;
			input.y = 200;
			
			/*input2.text = "Enter password";
			input2.name = "passwordinput";
			input2.prompt = "PASSWORD";
			input2.maxHeight = 50;
			input2.width = 300;
			input2.height = 50;
			input2.x = 100;
			input2.y = 200;
			input2.displayAsPassword = true;
			input2.addEventListener(FeathersEventType.ENTER, entered);*/
		}
		
		/*private function entered(e:FeathersEventType):void {
		dispatchEventWith("enterPressed", false, {username:input.text, password: input2.text}); 
		}*/
		
		override protected function initialize():void {
			input = new TextInput();
			addChild(input);
		}
	}
}