package Demo
{
	
	import flash.display.MovieClip;
	
	public class UsePool extends MovieClip
	{
		public function UsePool()
		{
			var date:Date = new Date();
			trace(date.seconds + ":" + date.milliseconds);
			TestPool.initPool(100000);
			date = new Date();
			trace(date.seconds + ":" + date.milliseconds);
			var objs:Array = [];
			for (var i:int = 0; i < 100000; i ++) {
				objs[i] = TestPool.getObject();
			}
			date = new Date();
			trace(date.seconds + ":" + date.milliseconds);
		}
	}
}