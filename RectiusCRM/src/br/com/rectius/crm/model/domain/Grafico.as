package br.com.rectius.crm.model.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Grafico")]
	public class Grafico
	{
		public var mes:String;
		public var quantidade:String;
		public var status:String;
		public var nomeCliente:String;
		public var nomeProjeto:String;
		public var horasEstimadas:String;
		public var horasRealizadas:String;
		public var percentualAndamento:String;
		
	}
}