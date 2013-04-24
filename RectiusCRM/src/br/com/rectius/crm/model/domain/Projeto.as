package br.com.rectius.crm.model.domain
{
	import flash.events.Event;
	
	import spark.formatters.DateTimeFormatter;
	import spark.formatters.NumberFormatter;

	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Projeto")]
	public class Projeto
	{
		public var id:Number;
		public var contrato:Contrato;
		public var tipo:String;
		public var nome:String;
		public var cliente:Cliente;
		public var inicio:Date;
		public var termino:Date;
		public var horasEstimadas:Number = 0;
		public var horasRealizadas:Number = 0;
		public var status:String;
		
		
		[Transient]
		public function get codigoContrato():String
		{
			return this.contrato.codigo;
		}
		
		[Transient]
		public function get nomeCliente():String
		{
			return this.cliente.nome;
		}
		
		[Transient]
		public function get valorProjeto():String
		{
			var numberFormat:NumberFormatter = new NumberFormatter();
			numberFormat.groupingSeparator = ".";
			numberFormat.decimalSeparator = ",";
			return numberFormat.format(this.contrato.valor);
		}
		
		[Transient]
		public function get horasProjeto():String
		{
			var numberFormat:NumberFormatter = new NumberFormatter();
			numberFormat.groupingSeparator = ".";
			numberFormat.trailingZeros = true;
			numberFormat.fractionalDigits = 0;
			return numberFormat.format(this.horasRealizadas) + '/' + numberFormat.format(this.horasEstimadas); 
		}
		
		[Transient]
		public function get andamentoProjeto():Number
		{
			var _andamento:Number = 0;
			
			try
			{
				_andamento = (this.horasRealizadas/this.horasEstimadas) * 100;	
			}
			catch (ex:Event)
			{
				_andamento = 0;
			}
			
			return isNaN(_andamento) ? 0 : _andamento;
		}
		
		[Transient]
		public function get periodo():String
		{
			var dateFormat:DateTimeFormatter = new DateTimeFormatter();
			dateFormat.dateTimePattern = "dd/MM/yyyy";
			
			var dt:String = "";
			
			dt += this.termino ? dateFormat.format(this.inicio) + ' - ' + dateFormat.format(this.termino) : dateFormat.format(this.inicio);
			
			return dt;
		}
		
		[Transient]
		public function get tipoNome():String
		{
			switch(tipo)
			{
				case "D":
				{
					return "Desktop";
				}
				case "W":
				{
					return "Web";
				}
				case "M":
				{
					return "Mobile";
				}
				case "O":
				{
					return "Outros";
				}
			}
			return tipo; 
		}
		
		[Transient]
		public function get statusNome():String
		{
			switch(status)
			{
				case "AG":
				{
					return "Aguardando";
				}
				case "EA":
				{
					return "Em andamento";
				}
				case "HL":
				{
					return "Homologando";
				}
				case "FN":
				{
					return "Finalizado";
				}
			}
			
			return status;
			
		}
		
		[Transient]
		public function get inicioFormatado():String
		{
			var dateFormat:DateTimeFormatter = new DateTimeFormatter();
			dateFormat.dateTimePattern = "MMM/yyyy";
			return dateFormat.format(inicio);
		}
		
		[Transient]
		public function get terminoFormatado():String
		{
			var dateFormat:DateTimeFormatter = new DateTimeFormatter();
			dateFormat.dateTimePattern = "MMM/yyyy";
			return dateFormat.format(termino);
		}
		
	}
}