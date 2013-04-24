package br.com.rectius.crm.model.domain
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="br.com.rectius.crm.vo.UsuarioGrupo")]
	public class UsuarioGrupo
	{
		public var id:Number = 0;
		public var nome:String;
		public var permissoes:ArrayCollection = new ArrayCollection();
		public var usuarios:ArrayCollection = new ArrayCollection();
		
		public function toString():String 
		{
			return nome;
		}
	}
}