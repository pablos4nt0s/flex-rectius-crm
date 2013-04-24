package br.com.rectius.crm.view.components
{
	import spark.components.gridClasses.GridColumn;
	import spark.formatters.DateTimeFormatter;

	public final class DataGridLabelFunctions
	{
		
		public static function statusLabelFunction(item:Object, column:GridColumn):String
		{
			switch(item.status)
			{
				case "A":
				{
					return "Ativo";
				}
				case "I":
				{
					return "Inativo";
				}
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
			
			return item.status;
		}
		
		public static function dateLabelFunction(item:Object, column:GridColumn):String
		{
			var dateFormat:DateTimeFormatter = new DateTimeFormatter();
			dateFormat.dateTimePattern = "dd/MM/yyyy";
			return dateFormat.format(item[column.dataField]);
		}
	}
}