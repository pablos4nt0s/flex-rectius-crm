package br.com.rectius.crm.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	
	public class LoginDelegate implements ILoginDelegate
	{
		[Inject(source="loginService")]
		public var service:RemoteObject;
		
		public function login(username:String, password:String):AsyncToken
		{
			return service.login(username, password);
		}
	}
}