package br.com.rectius.crm.events
{
	import br.com.rectius.crm.model.domain.Projeto;
	
	import flash.events.Event;
	
	public class ProjetoEvent extends Event
	{
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		public static const LIST:String = "projetoEvent.List";
		public static const SAVE:String = "projetoEvent.Save";
		public static const UPDATE:String = "projetoEvent.Update";
		public static const REMOVE:String = "projetoEvent.Remove";
		
		public static const LIST_GRAFICO_QUANTIDADE_STATUS:String = "projetoEvent.ListGraficoQuantidadeStatus";

		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		public var projeto:Projeto;
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function ProjetoEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods 
		//
		//--------------------------------------------------------------------------
		
		override public function clone():Event
		{
			var event:ProjetoEvent = new ProjetoEvent(type, bubbles, cancelable);
			event.projeto = projeto;
			return event;
		}
	}
}