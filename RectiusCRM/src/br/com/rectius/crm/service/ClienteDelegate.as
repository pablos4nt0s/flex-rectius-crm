package br.com.rectius.crm.service
{
	import br.com.rectius.crm.model.domain.Cliente;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class ClienteDelegate implements IClienteDelegate
	{
		[Inject(source="clienteService")]		
		public var service:RemoteObject;
		
		public function list():AsyncToken
		{
			return service.list();
		}
		
		public function save(cliete:Cliente):AsyncToken
		{
			return service.save(cliete);
		}
		
		public function update(cliete:Cliente):AsyncToken
		{
			return service.update(cliete);
		}
		
		public function remove(cliete:Cliente):AsyncToken
		{
			return service.remove(cliete);
		}
	}
}