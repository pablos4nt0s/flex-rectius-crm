package br.com.rectius.crm.controller
{
	import br.com.rectius.crm.model.domain.Cliente;
	import br.com.rectius.crm.model.presentation.ClientePresentationModel;
	import br.com.rectius.crm.service.IClienteDelegate;
	import br.com.rectius.library.notificator.NotificatorManager;
	import br.com.rectius.library.notificator.NotificatorMode;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;

	public class ClienteController extends AbstractController
	{
		[Bindable]
		[Inject]
		public var model:ClientePresentationModel;
		
		[Inject]
		public var delegate:IClienteDelegate;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[EventHandler(event="ClienteEvent.LIST")]
		public function list():void
		{
			var call:AsyncToken = delegate.list();
			serviceHelper.executeServiceCall(call, listResultHandler, super.faultHandler);
		}
		
		[EventHandler(event="ClienteEvent.SAVE", properties="cliente")]
		public function save(cliente:Cliente):void
		{
			var call:AsyncToken = delegate.save(cliente);
			serviceHelper.executeServiceCall(call, resultHandler, super.faultHandler); 
		}
		
		[EventHandler(event="ClienteEvent.UPDATE", properties="cliente")]
		public function update(cliente:Cliente):void
		{
			var call:AsyncToken = delegate.update(cliente);
			serviceHelper.executeServiceCall(call, resultHandler, super.faultHandler); 
		}
		
		[EventHandler(event="ClienteEvent.REMOVE", properties="cliente")]
		public function remove(cliente:Cliente):void
		{
			var call:AsyncToken = delegate.remove(cliente);
			serviceHelper.executeServiceCall(call, resultHandler, super.faultHandler); 
		}
		
		private function listResultHandler(event:ResultEvent):void
		{
			if(event.result)
			{
				model.arrClientes = event.result as ArrayCollection;
			}
		}
		
		private function resultHandler(event:ResultEvent):void
		{
			if(event.result)
			{
				model.arrClientes = event.result as ArrayCollection;
				NotificatorManager.show("A operação foi realizada com sucesso!", NotificatorMode.SUCCESS);
				
			}
		}
		
	}
}