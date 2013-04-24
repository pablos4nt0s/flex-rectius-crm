package br.com.rectius.crm.controller
{
	import br.com.rectius.crm.events.LoginEvent;
	import br.com.rectius.crm.model.domain.Usuario;
	import br.com.rectius.crm.model.presentation.MainPresentationModel;
	import br.com.rectius.crm.service.ILoginDelegate;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.storage.SharedObjectBean;
	import org.swizframework.utils.services.ServiceHelper;
	

	public class ApplicationController
	{
		
		[Bindable]
		[Inject]
		public var model:MainPresentationModel;

		[Inject]
		public var loginDelegate:ILoginDelegate;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var so:SharedObjectBean;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[PostConstruct]
		public function init():void
		{
			var lstUsername:String = so.getString("lastUsername");
			
			if(lstUsername != null)
				model.lastUsername = lstUsername;
		}
		
		
		//--------------------------------------------------------------------------
		//
		// login / logout handling
		//
		//--------------------------------------------------------------------------
		
		[EventHandler(event="LoginEvent.LOGIN", properties="usuario")]
		public function login(usuario:Usuario):void
		{
			var call:AsyncToken = loginDelegate.login(usuario.usuario, usuario.senha);
			serviceHelper.executeServiceCall(call, loginResultHandler, loginFaultHandler);
		}
		
		protected function loginResultHandler(event:ResultEvent):void
		{
			if(event.result)
			{
				var u:Usuario = event.result as Usuario;
				
				model.lastUsername = u.usuario;
				so.setString("lastUsername", u.usuario);
				
				model.currentUser = u;
				
				dispatcher.dispatchEvent(new LoginEvent(LoginEvent.SUCCESS, true));
			}
			else 
			{
				dispatcher.dispatchEvent(new LoginEvent(LoginEvent.FAILURE, true));
			}
		}
		
		protected function loginFaultHandler(event:FaultEvent):void
		{
			var loginEvent:LoginEvent = new LoginEvent(LoginEvent.FAILURE, true);
			loginEvent.loginFault = event.fault;
			
			dispatcher.dispatchEvent(loginEvent);
		}
		
	}
}