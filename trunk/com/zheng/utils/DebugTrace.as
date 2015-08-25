package com.zheng.utils
{
	import com.hexagonstar.util.debug.Debug;
	
	import flash.display.DisplayObject;
	
	import nl.demonsters.debugger.MonsterDebugger;

	/**
	 * 调试类
	 * @author zhengzihua
	 */
	public class DebugTrace 
	{
		/**
		 *  是否trace
		 */
		private static var CANTRACE:Boolean = CONFIG::debugging;
		
		private static var _instance:DebugTrace;
		
		private var d:MonsterDebugger;
		
		public function DebugTrace(single:Singleton) 
		{
			if(single == null)
			{
				throw new Error("Can't create instance , Single is Null!");
			}
		}
		public static function get instance():DebugTrace{
			if(_instance==null)_instance=new DebugTrace(new Singleton);
			return _instance;
		}
		/**
		 * 监视对象 
		 * @param obj
		 * 
		 */
		public function setMonitorObj(obj:Object):void{
			CANTRACE{
				d=new MonsterDebugger(obj);
			}
		}
		/**
		 * flash.trace
		 * alcon.trace
		 * @param	str
		 */
		public static function dtrace(str:String):void {
			CANTRACE{
				Debug.trace(str);
				trace(str);
			}
		} 
		/**
		 * MonsterDebugger.trace
		 * @param	tar
		 * @param	obj
		 */
		public static function monsterDebug(tar:Object,obj:Object):void{
			CANTRACE{
				MonsterDebugger.trace(tar, obj);
				trace(tar,obj);
			}
		}
		/**
		 * MonsterDebugger.inspect
		 * @param	obj
		 */
		public static function inspect(obj:Object):void{
			CANTRACE{
				MonsterDebugger.inspect(obj);
			}
		}
		/**
		 * alcon.traceObj
		 * @param	obj
		 */
		public static function traceObj(obj:Object):void {
			CANTRACE{ 
				Debug.traceObj(obj);
			}
		}
		/**
		 * 对显示对象的快照
		 * @param	display
		 */
		public static function snapshot(display:DisplayObject):void{
			CANTRACE{
				MonsterDebugger.snapshot(display);
			}
		}
	}
	
}
class Singleton{}