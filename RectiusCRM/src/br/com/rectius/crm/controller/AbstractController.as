package br.com.rectius.crm.controller
{
	import br.com.rectius.library.notificator.NotificatorManager;
	import br.com.rectius.library.notificator.NotificatorMode;
	
	import mx.rpc.events.FaultEvent;

	public class AbstractController
	{
		protected function faultHandler(event:FaultEvent):void
		{
			NotificatorManager.show("Desculpe, não foi possível completar sua operação!", NotificatorMode.FAILURE, 3500);
		}
	}
}