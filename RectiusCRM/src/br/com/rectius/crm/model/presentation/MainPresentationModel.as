package br.com.rectius.crm.model.presentation
{
	import br.com.rectius.crm.events.LoginEvent;
	import br.com.rectius.crm.model.ApplicationState;
	import br.com.rectius.crm.model.domain.Menu;
	import br.com.rectius.crm.model.domain.Permissao;
	import br.com.rectius.crm.model.domain.Usuario;
	import br.com.rectius.library.notificator.NotificatorManager;
	
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.events.BeanEvent;
	
	
	public class MainPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		public var lastUsername:String;
		
		[Bindable]
		public var currentUser:Usuario;
		
		[Bindable]
		public var currentState:String = ApplicationState.LOGGED_OUT;
		
		[Bindable]
		public var arrMenu:ArrayCollection = new ArrayCollection([
			new Menu(1, 'Menu', true),
			new Menu(2, 'Dashboard')
		]);
		
		private var _menuSelecionado:Number = 0;
		
		[Bindable]
		public function set menuSelecionado(value:Number):void
		{
			_menuSelecionado = value;
		}
		
		public function get menuSelecionado():Number
		{
			return _menuSelecionado; 
		}
		
		public function changeMenuSelection(menu:Menu):void
		{
			
			for each(var m:Menu in arrMenu)
			{
				m.selecionado = false;
				if(m.id == menu.id)
				{
					m.selecionado = true;
					menuSelecionado = m.id - 1;
				}
			}
			arrMenu.refresh();
		}

		public function hasPermissao(codigo:String):Boolean
		{
			for each(var perm:Permissao in currentUser.listaPermissoes)
			{
				if(perm.codigo == codigo)
					return true;
			}
			
			return false;
		}
		
		public function logout() : void
		{
			var logout:URLRequest = new URLRequest("javascript:location.reload(true)");
			navigateToURL(logout,"_self");
		}
		
		[EventHandler(event="LoginEvent.SUCCESS", priority="2")]
		public function handleLoginComplete(event:LoginEvent):void
		{
			currentState = ApplicationState.LOGGED_IN;
		}
		
		public function destroy():void
		{
			dispatcher.dispatchEvent( new BeanEvent( BeanEvent.TEAR_DOWN_BEAN, this ) );
		}

	}
}