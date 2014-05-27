package Classes
{
	import starling.events.EventDispatcher;
	
	public class CustomDispatcher extends EventDispatcher {
		public static var SENDINFO:String = "senduserinfo";
		public static var SENDTOSOCKET:String = "sendtosocket";
		
		public function doAction(obj:Object):void {
			trace(obj.username + " " + "in doaction");
			var data:String = obj.username + " " + obj.password
			dispatchEventWith(SENDINFO, true, data);
		}
		
		/*public function doAction2(data:String):void {
			dispatchEventWith(SENDTOSOCKET, true, data);
		}*/
	}
}