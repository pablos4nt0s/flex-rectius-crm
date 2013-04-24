package br.com.rectius.crm.view.components
{
	import br.com.rectius.library.form.DropDownListSelector;
	
	import mx.collections.ArrayCollection;
	
	public class ProjetoDropdownTipo extends DropDownListSelector
	{
		public function ProjetoDropdownTipo()
		{
			super();
			
			super.dataProvider = new ArrayCollection([
				{data: 'D', label: 'Desktop'},
				{data: 'M', label: 'Mobile'},
				{data: 'W', label: 'Web'},
				{data: 'O', label: 'Outros'}
			]);
		}
		
	}
}