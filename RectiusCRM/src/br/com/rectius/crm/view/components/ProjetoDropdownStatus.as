package br.com.rectius.crm.view.components
{
	import br.com.rectius.library.form.DropDownListSelector;
	
	import mx.collections.ArrayCollection;
	
	public class ProjetoDropdownStatus extends DropDownListSelector
	{
		public function ProjetoDropdownStatus()
		{
			super();
			
			super.dataProvider = new ArrayCollection([
				{data: 'AG', label: 'Aguardando'},
				{data: 'EA', label: 'Em andamento'},
				{data: 'HL', label: 'Homologando'},
				{data: 'FN', label: 'Finalizado'}
			]);
		}
	}
}