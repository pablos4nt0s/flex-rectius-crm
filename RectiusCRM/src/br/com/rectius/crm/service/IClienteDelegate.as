package br.com.rectius.crm.service
{
	
	import br.com.rectius.crm.model.domain.Cliente;
	
	import mx.rpc.AsyncToken;

	public interface IClienteDelegate
	{
		function list():AsyncToken;
		function save(cliente:Cliente):AsyncToken;
		function update(cliente:Cliente):AsyncToken;
		function remove(cliente:Cliente):AsyncToken;
	}
}