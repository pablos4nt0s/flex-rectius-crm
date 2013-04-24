package br.com.rectius.crm.model.presentation
{
	import br.com.rectius.crm.events.ClienteEvent;
	import br.com.rectius.crm.model.domain.Cliente;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;

	public class ClientePresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		public var arrClientes:ArrayCollection;
		
		[Bindable]
		public var clienteSelecionado:Cliente;

		public function list():void
		{
			dispatcher.dispatchEvent(new ClienteEvent(ClienteEvent.LIST));
		}
		
		public function save(cliente:Cliente):void
		{
			var event:ClienteEvent = new ClienteEvent(ClienteEvent.SAVE);
			event.cliente = cliente;
			
			dispatcher.dispatchEvent(event);	
		}
		
		public function update(cliente:Cliente):void
		{
			var event:ClienteEvent = new ClienteEvent(ClienteEvent.UPDATE);
			event.cliente = cliente;
			
			dispatcher.dispatchEvent(event);	
		}
		
		public function remove(cliente:Cliente):void
		{
			var event:ClienteEvent = new ClienteEvent(ClienteEvent.REMOVE);
			event.cliente = cliente;
			
			dispatcher.dispatchEvent(event);
		}
		
	}
}