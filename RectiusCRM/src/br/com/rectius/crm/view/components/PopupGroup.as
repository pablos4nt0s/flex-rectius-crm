package br.com.rectius.crm.view.components
{
	import mx.core.IFlexDisplayObject;
	import mx.managers.IFocusManagerContainer;
	
	import spark.components.Group;
	
	public class PopupGroup extends Group implements IFocusManagerContainer
	{
		public function PopupGroup()
		{
			super();
		}
		
		public function get defaultButton():IFlexDisplayObject
		{
			return null;
		}
		
		public function set defaultButton(value:IFlexDisplayObject):void
		{
		}
	}
}