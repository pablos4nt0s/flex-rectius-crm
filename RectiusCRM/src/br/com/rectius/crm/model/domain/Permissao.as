package br.com.rectius.crm.model.domain
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Permissao")]
	public class Permissao
	{
		public var id:int;
		public var codigo:String;
		public var descricao:String;
	}
}