package br.com.rectius.crm.view.components
{
	import mx.events.FlexEvent;
	
	import spark.components.NavigatorContent;
	import spark.effects.Move;
	
	public class NavigatorContentAnimated extends NavigatorContent
	{
		
		private var moveIn:Move;
		private var moveOut:Move;
		
		public function NavigatorContentAnimated()
		{
			super();
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, creationComplenteHandler);
			this.addEventListener(FlexEvent.SHOW, showEventHandler);
			this.addEventListener(FlexEvent.HIDE, hideEventHandler);
			
			moveIn = new Move(this);
			moveOut = new Move(this);
		}
		
		protected function showEventHandler(event:FlexEvent):void
		{
			moveIn.xFrom = -this.parent.width;
			moveIn.xTo = 0;
		}
		
		protected function hideEventHandler(event:FlexEvent):void
		{
			moveOut.xFrom = 0;
			moveOut.xTo = -this.parent.width;
		}
		
		protected function creationComplenteHandler(event:FlexEvent):void
		{
			this.setStyle("showEffect", moveIn);
			this.setStyle("hideEffect", moveOut);
		}
		
	}
}