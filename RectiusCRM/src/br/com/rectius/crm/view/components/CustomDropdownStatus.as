package br.com.rectius.crm.view.components
{
	import br.com.rectius.library.form.DropDownListSelector;
	
	import mx.collections.ArrayCollection;
	
	public class CustomDropdownStatus extends DropDownListSelector
	{
		public function CustomDropdownStatus()
		{
			super();
			
			this.dataProvider = new ArrayCollection([
				{data: 'A', label: 'Ativo'},
				{data: 'I', label: 'Inativo'}
			]);
		}
	}
}