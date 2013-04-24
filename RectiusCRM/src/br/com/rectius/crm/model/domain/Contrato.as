package br.com.rectius.crm.model.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Contrato")]
	public class Contrato
	{
		public var id:Number;
		public var codigo:String;
		public var valor:Number;
		//public var parcelas:ArrayCollection;
		public var status:String;		
	}
}