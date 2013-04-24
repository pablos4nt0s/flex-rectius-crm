package br.com.rectius.crm.model.presentation
{
	import br.com.rectius.crm.events.LoginEvent;
	import br.com.rectius.crm.model.domain.Usuario;
	import br.com.rectius.library.notificator.NotificatorManager;
	
	import flash.events.IEventDispatcher;
	
	import mx.events.ValidationResultEvent;
	import mx.rpc.Fault;
	import mx.validators.StringValidator;
	
	import org.swizframework.events.BeanEvent;
	
	
	public class LoginPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function login(username:String, password:String):void
		{
			if(validate(username, password))
			{
				var loginEvent:LoginEvent = new LoginEvent( LoginEvent.LOGIN);
				var u:Usuario = new Usuario();
				u.usuario = username;
				u.senha = password;
				loginEvent.usuario = u;
				
				dispatcher.dispatchEvent(loginEvent);
			}
		}
		
		protected var stringValidator:StringValidator;
		
		public function validate(username:String, password:String):Boolean
		{
			var valid:Boolean = false;
			
			stringValidator ||= new StringValidator();
			
			var stringValidation: ValidationResultEvent = stringValidator.validate( username );
			var validUserName:Boolean = stringValidation.results == null;
			
			stringValidation = stringValidator.validate( password );
			var validPassword:Boolean = stringValidation.results == null;
			
			return validUserName && validPassword;
		}
		
		[EventHandler(event="LoginEvent.FAILURE", properties="loginFault")]
		public function handleLoginError(fault:Fault):void
		{
			NotificatorManager.show("Dados inválidos. Por favor, tente novamente!");
		}
		
		public function destroy():void
		{
			dispatcher.dispatchEvent( new BeanEvent( BeanEvent.TEAR_DOWN_BEAN, this ) );
		}
		
	}
}