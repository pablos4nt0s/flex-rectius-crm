package br.com.rectius.crm.events
{
	
	import br.com.rectius.crm.model.domain.Usuario;
	
	import flash.events.Event;
	
	import mx.rpc.Fault;
	
	public class LoginEvent extends Event
	{
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		public static const LOGIN:String = "loginEvent.Login";
		public static const LOGOUT:String = "loginEvent.Logout";
		public static const FAILURE:String = "loginEvent.Failure";
		public static const SUCCESS:String = "loginEvent.Success";

		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		public var usuario:Usuario;
		public var loginFault:Fault;


		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function LoginEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
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
			var event:LoginEvent = new LoginEvent(type, bubbles, cancelable);
			event.usuario = usuario;
			event.loginFault = loginFault;
			
			return event;
		}
	}
}