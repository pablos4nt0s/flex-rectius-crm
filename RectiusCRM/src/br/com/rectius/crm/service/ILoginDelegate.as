package br.com.rectius.crm.service
{
	import mx.rpc.AsyncToken;

	public interface ILoginDelegate
	{
		function login(username:String, password:String):AsyncToken;	
	}
}