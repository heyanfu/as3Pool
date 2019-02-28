package Demo
{
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class TestPool extends Sprite
	{
		
		public function TestPool()
		{
			calTime();
		}
		
		private function calTime():void {
			var date:Date = new Date();
			var objs:Array = [];
			var t:int;
//			trace(date.seconds + ":" + date.milliseconds);
			for (var i:int = 0; i < 10000; i ++) {
				t = 12345 + 54321;
				t = 12345 * 54321;
//				objs.push(new MovieClip());
			}
			date = new Date();
//			trace(date.seconds + ":" + date.milliseconds);
		}
		
		private static var objs:Array;
		private static var count:int;
		private static var size:int;
		public static function initPool(maxSize:int):void {
			size = maxSize;
			count = maxSize;
			objs = [];
			for (var i:int = 0; i < maxSize; i ++) {
				objs.push(new MovieClip());
			}
		}
		
		public static function getObject():MovieClip {
			if (count > 0) {
				count --;
				return objs[count];
			}
			
			for (var i:int = 0; i < size; i ++) {
				objs.unshift(new MovieClip());
			}
			count = size;
			return getObject();
		}
		
		public static function dispose(mc:MovieClip):void {
			objs[count] = mc;
			count ++;
		}
	}
	
}