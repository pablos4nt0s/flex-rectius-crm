package br.com.rectius.crm.controller
{
	import br.com.rectius.crm.model.domain.Projeto;
	import br.com.rectius.crm.model.presentation.ProjetoPresentationModel;
	import br.com.rectius.crm.service.IProjetoDelegate;
	import br.com.rectius.library.notificator.NotificatorManager;
	import br.com.rectius.library.notificator.NotificatorMode;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;

	public class ProjetoController extends AbstractController
	{
		[Bindable]
		[Inject]
		public var model:ProjetoPresentationModel;
		
		[Inject]
		public var delegate:IProjetoDelegate;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[EventHandler(event="ProjetoEvent.LIST")]
		public function list():void
		{
			var call:AsyncToken = delegate.list();
			serviceHelper.executeServiceCall(call, listResultHandler, super.faultHandler);
		}
		
		[EventHandler(event="ProjetoEvent.SAVE", properties="projeto")]
		public function save(projeto:Projeto):void
		{
			var call:AsyncToken = delegate.save(projeto);
			serviceHelper.executeServiceCall(call, resultHandler, super.faultHandler); 
		}
		
		[EventHandler(event="ProjetoEvent.UPDATE", properties="projeto")]
		public function update(projeto:Projeto):void
		{
			var call:AsyncToken = delegate.update(projeto);
			serviceHelper.executeServiceCall(call, resultHandler, super.faultHandler); 
		}
		
		[EventHandler(event="ProjetoEvent.REMOVE", properties="projeto")]
		public function remove(projeto:Projeto):void
		{
			var call:AsyncToken = delegate.remove(projeto);
			serviceHelper.executeServiceCall(call, resultHandler, super.faultHandler); 
		}
		
		[EventHandler(event="ProjetoEvent.LIST_GRAFICO_QUANTIDADE_STATUS")]
		public function listGraficoQuantidadeStatus():void
		{
			var call:AsyncToken = delegate.listGraficoQuantidadePorStatus();
			serviceHelper.executeServiceCall(call, listGraficoResultHandler, super.faultHandler);
		}
		
		private function listGraficoResultHandler(event:ResultEvent):void
		{
			if(event.result)
			{
				model.arrGraficoQtdeStatus = event.result as ArrayCollection;
			}
		}
		
		private function listResultHandler(event:ResultEvent):void
		{
			if(event.result)
			{
				model.arrProjetos = event.result as ArrayCollection;
				
				var valorTotal:Number = 0;
				var valorRecebido:Number = 0;
				var valorPendente:Number = 0;
				for each(var p:Projeto in event.result)
				{
					valorTotal += p.contrato.valor;
				}
				
				model.valorTotal = valorTotal;
				
			}
		}
		
		private function resultHandler(event:ResultEvent):void
		{
			if(event.result)
			{
				model.arrProjetos = event.result as ArrayCollection;
				NotificatorManager.show("A operação foi realizada com sucesso!", NotificatorMode.SUCCESS);
				
			}
		}
		
	}
}