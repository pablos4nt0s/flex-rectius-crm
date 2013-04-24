package br.com.rectius.crm.service
{
	import br.com.rectius.crm.model.domain.Projeto;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class ProjetoDelegate implements IProjetoDelegate
	{
		[Inject(source="projetoService")]		
		public var service:RemoteObject;
		
		public function list():AsyncToken
		{
			return service.list();
		}
		
		public function save(projeto:Projeto):AsyncToken
		{
			return service.save(projeto);
		}
		
		public function update(projeto:Projeto):AsyncToken
		{
			return service.update(projeto);
		}
		
		public function remove(projeto:Projeto):AsyncToken
		{
			return service.remove(projeto);
		}
		
		public function listGraficoQuantidadePorStatus():AsyncToken
		{
			return service.listGraficoQuantidadePorStatus();
		}
	}
}