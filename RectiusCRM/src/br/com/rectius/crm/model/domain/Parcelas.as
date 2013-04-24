package br.com.rectius.crm.model.domain
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;

	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Parcelas")]
	public class Parcelas
	{
		public var id:Number = 0;
		public var numero:Number;
		public var valor:Number;
		public var contrato:Contrato;
		public var status:String;
	}
}