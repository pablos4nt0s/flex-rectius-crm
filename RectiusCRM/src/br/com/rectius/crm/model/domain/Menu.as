package br.com.rectius.crm.model.domain
{
	
	[Bindable]
	public class Menu
	{
		private var _id:int;
		private var _nome:String;
		private var _selecionado:Boolean;
		
		public function Menu(id:int, nome:String, selecionado:Boolean=false)
		{
			this._id = id;
			this._nome = nome;
			this._selecionado = selecionado;
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get nome():String
		{
			return this._nome;
		}
		public function set nome(value:String):void
		{
			this._nome = value;
		}
		
		public function get selecionado():Boolean
		{
			return this._selecionado;
		}
		public function set selecionado(value:Boolean):void
		{
			this._selecionado= value;
		}
		
	}
}