package br.com.rectius.crm.service
{
	import br.com.rectius.crm.model.domain.Projeto;
	
	import mx.rpc.AsyncToken;

	public interface IProjetoDelegate
	{
		function list():AsyncToken;
		function save(projeto:Projeto):AsyncToken;
		function update(projeto:Projeto):AsyncToken;
		function remove(projeto:Projeto):AsyncToken;
		function listGraficoQuantidadePorStatus():AsyncToken;
	}
}