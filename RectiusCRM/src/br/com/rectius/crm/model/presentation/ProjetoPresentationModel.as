package br.com.rectius.crm.model.presentation
{
	import br.com.rectius.crm.events.ProjetoEvent;
	import br.com.rectius.crm.model.domain.Projeto;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.events.BeanEvent;

	public class ProjetoPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		private var _arrProjetos:ArrayCollection;
		
		[Bindable]
		public var valorTotal:Number = 0;
		
		[Bindable]
		public var projetoSelecionado:Projeto;
		
		[Bindable]
		public var arrGraficoQtdeStatus:ArrayCollection;

		
		[Bindable]
		public function get arrProjetos():ArrayCollection
		{
			return _arrProjetos;
		}

		public function set arrProjetos(value:ArrayCollection):void
		{
			_arrProjetos = value;
			
			calculaValorTotalProjetos();
		}

		public function list():void
		{
			dispatcher.dispatchEvent(new ProjetoEvent(ProjetoEvent.LIST));
		}
		
		public function save(projeto:Projeto):void
		{
			var event:ProjetoEvent = new ProjetoEvent(ProjetoEvent.SAVE);
			event.projeto = projeto;
			
			dispatcher.dispatchEvent(event);	
		}
		
		public function update(projeto:Projeto):void
		{
			var event:ProjetoEvent = new ProjetoEvent(ProjetoEvent.UPDATE);
			event.projeto = projeto;
			
			dispatcher.dispatchEvent(event);	
		}
		
		public function remove(projeto:Projeto):void
		{
			var event:ProjetoEvent = new ProjetoEvent(ProjetoEvent.REMOVE);
			event.projeto = projeto;
			
			dispatcher.dispatchEvent(event);
		}
		
		public function listGraficoQuantidedadeStatus():void
		{
			dispatcher.dispatchEvent(new ProjetoEvent(ProjetoEvent.LIST_GRAFICO_QUANTIDADE_STATUS));
		}
		
		public function calculaValorTotalProjetos():void
		{
			valorTotal = 0;
			for each(var p:Projeto in arrProjetos)
			{
				valorTotal += p.contrato.valor;
			}
		}
		
		public function destroy():void
		{
			dispatcher.dispatchEvent( new BeanEvent( BeanEvent.TEAR_DOWN_BEAN, this ) );
		}
		
		
	}
}