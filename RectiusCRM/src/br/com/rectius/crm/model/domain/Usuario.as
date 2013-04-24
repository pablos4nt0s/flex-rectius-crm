package br.com.rectius.crm.model.domain
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.Usuario")]
	public class Usuario
	{
		public var id:int;
		public var usuario:String;
		public var senha:String;
		public var email:String;
		public var nome:String;
		public var grupos:ArrayCollection;
		public var projetos:ArrayCollection;
		
		public function get listaPermissoes():ArrayCollection
		{
			var lista:ArrayCollection = new ArrayCollection();
			
			for each(var grp:UsuarioGrupo in grupos)
			{
				for each(var perm:Permissao in grp.permissoes)
				{
					if(!lista.contains(perm))
						lista.addItem(perm);
				}
			}
			
			return lista;
		}
		
	}
}