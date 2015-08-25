//code
/**
 * ��    ��������mc����ʾ����
 * ��    �ߣ�frozensun
 * ��    �ڣ�09.02.06
*/
package com.zheng.utils
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
 
	public class NumMcCtrl
	{
		public static const LEFT:String="left";
		public static const RIGHT:String="right";
		public static const CENTER:String="center";
 
		private var mc:MovieClip;
		//��ǰֵ
		private var _value:int;
		//���뷽ʽ
		private var _align:String;
		//��������ֵ�mc�ĳ�ʼλ��
		private var _arrNumPos:Array;
		//ԭ����һ����ĸ�����һ�����ּ�ľ���
		private var _primalDis:Number;
		//��������ʱ���ٶ�
		private var _rollSpd:int;
		//��������Ŀ����ֵ
		private var _targetNum:int;
		//λ��
		private var _digit:int
 
		// movieClip:Ҫ���Ƶ�MC������, align:�������ı߶���
		public function NumMcCtrl(movieClip:MovieClip, align:String="left")
		{
			mc=movieClip;
 
			align!=LEFT && align!=RIGHT && align!=CENTER && (align=LEFT);
			_align=align;
 
			_digit=mc.numChildren;
 
			_arrNumPos=[];
			for(var i:uint;i<this._digit;i++)
			{
				mc["num"+i].stop();
				_arrNumPos.push(mc["num"+i].x);
			}
			_primalDis=_arrNumPos[_arrNumPos.length-1]-_arrNumPos[0];
 
			redrawValue();
		}
 
		//���õ�ǰ��ʾֵ
		public function get value():int
		{
			return _value;
		}
		public function set value(num:int):void
		{
			if(String(num).length>this._digit)
			{
				throw( new Error("������"+mc+"������ʾ�����ֵ"));
			}
			num<0 && (num=0);
			if(_value!=num)
			{
				_value=num;
				redrawValue();
			}
		}
		//�����ı����뷽ʽ
		public function get align():String
		{
			return this._align;
		}
		public function set align(value:String):void
		{
			value!=LEFT && value!=RIGHT && value!=CENTER && (value=LEFT);
			if(_align!=value)
			{
				this._align=value;
				redrawValue();
			}
		}
		//�����ֹ�����ʾ��
		public function rollTo(spd:int, To:int, From:int=0):void
		{
			if(String(To).length>this._digit || String(From).length>this._digit)
			{
				throw( new Error("������"+mc+"������ʾ�����ֵ"));
			}
			this._rollSpd=spd;
			this._targetNum=To;
			this.value=From;
			mc.addEventListener(Event.ENTER_FRAME,eRollHandler);
		}
		//������ֵ
		private function eRollHandler(e:Event):void
		{
			if(!mc.stage)
			{
				mc.removeEventListener(Event.ENTER_FRAME,eRollHandler);
				return;
			}
			//trace("--------------");
			if(this._rollSpd<0)
			{
				if(this._value>_targetNum)
				{
					this.value+=this._rollSpd;
				}
				else
				{
					this.value=this._targetNum;
					mc.removeEventListener(Event.ENTER_FRAME,eRollHandler);
				}
			}
			else
			{
				if(this._value<_targetNum)
				{
					this.value+=this._rollSpd;
				}
				else
				{
					this.value=this._targetNum;
					mc.removeEventListener(Event.ENTER_FRAME,eRollHandler);
				}
			}
		}
		//ˢ����ʾ
		private function redrawValue():void
		{
			var len:int=String(_value).length;
			var index:int;
			//trace("value:",_value);
 
			for(var i:uint;i<this._digit;i++)
			{
				mc["num"+i].visible=false;
				mc["num"+i].gotoAndStop(1);
			}
			for(index=0;index<len;index++)
			{
				mc["num"+index].visible=true;
				mc["num"+index].gotoAndStop(int( String(_value).charAt(index) ) + 1);
				//trace("    ��",index,"λ:",String(_value).charAt(index));
			}
			switch(this._align)
			{
				case LEFT:
					for(index=0;index<len;index++)
					{
						mc["num"+index].x=this._arrNumPos[index];
					}
				break;
 
				case CENTER:
					for(index=0;index<len;index++)
					{
						mc["num"+index].x=this._arrNumPos[index]+this._primalDis/(_digit-1)*(_digit-len)/2;
					}
				break;
 
				case RIGHT:
					for(index=0;index<len;index++)
					{
						mc["num"+index].x=this._arrNumPos[index]+this._primalDis/(_digit-1)*(_digit-len);
					}
				break;
			}
		}
	}
}