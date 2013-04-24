package br.com.rectius.crm.model.domain
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Cliente")]
	public class Cliente
	{
		public var id:int;
		public var razaoSocial:String;
		public var nome:String;
		public var identificacao:String;
		public var email:String;
		public var telefones:ArrayCollection;
		public var enderecos:ArrayCollection;
		public var status:String;
	}
}