package br.com.rectius.crm.events
{
	import br.com.rectius.crm.model.domain.Cliente;
	
	import flash.events.Event;
	
	public class ClienteEvent extends Event
	{
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		public static const LIST:String = "clienteEvent.List";
		public static const SAVE:String = "clienteEvent.Save";
		public static const UPDATE:String = "clienteEvent.Update";
		public static const REMOVE:String = "clienteEvent.Remove";

		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		public var cliente:Cliente;
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function ClienteEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods 
		//
		//--------------------------------------------------------------------------
		
		override public function clone():Event
		{
			var event:ClienteEvent = new ClienteEvent(type, bubbles, cancelable);
			event.cliente = cliente;
			return event;
		}
	}
}