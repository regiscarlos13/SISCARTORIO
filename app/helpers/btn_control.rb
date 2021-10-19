module BtnControl

	def btn_new(link, option = false)
		link_to " ",link, remote: option,class: "btn btn-success float-right fa fa-plus-circle mr-2",	title: "Novo Registro", data: { disable_with: ' <i class="fa fa-circle-o-notch fa-spin fa-fw"></i>'}
	end
	
	def btn_print(link)
		link_to " ", link, target: "_blank", class: "btn btn-warning float-right fa fa-print ", title: "Imprimir"
	end
	
	def btn_show(link, option = false)
		link_to "", link, remote: option, class: "btn btn-info btn-sm fa fa-search", title: "Mostrar Registros"	
	end
	
	def btn_edit( link, option = false)
		link_to '', link, remote: option, class: 'btn btn-secondary btn-sm fa fa-edit', title: "Edição de Registros"
	end

	def btn_edit1(link, option = false)
		link_to "Alterar", link, remote: option,class: "btn btn-primary fa fa-edit", title: "Edição de Registros"
	end

	def btn_delete(link, option = false)
		link_to "", link, remote: option, method: :delete, data: { confirm: "Voçê tem certeza quer apagar Registro" }, class: "btn btn-danger btn-sm fa fa-trash", title: "Remover Registros"
	end

	def btn_cancel(link)
		link_to " Cancelar", link, class: "btn btn-outline-danger btn-lg fa fa-arrow-left", title: "Cancelar"
	end

	def btn_save(option = false)
		button_tag ' Salvar', remote: option,  class: "btn btn-outline-primary  fa fa-floppy-o"

	end

end
