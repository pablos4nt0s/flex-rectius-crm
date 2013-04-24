package br.com.rectius.crm.view.components
{
	import mx.controls.DateField;
	
	public class CustomDateField extends DateField
	{
		public function CustomDateField()
		{
			super();
			
			this.formatString = "DD/MM/YYYY";
			this.monthNames = ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago', 'Set', 'Out', 'Nov', 'Dez'];
		}
	}
}