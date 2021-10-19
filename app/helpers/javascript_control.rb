module JavascriptControl
	
	def index_table_javascript
		javascript_include_tag  "datatables", "index"
	end

	def index_table_style
		stylesheet_link_tag "datatables" 
	end


	def pagination_table(campo)
		html = ""
		html << " <script type='text/javascript'>"
		html << " $(document).ready( function () {"
		html << "	$('#{campo}').DataTable({"
		html << " 'language': {"
		html << " 'sEmptyTable': 'Nenhum registro encontrado',"
		html << " 'oPaginate': {"
		html << "    'sNext': 'Próximo',"
		html << "    'sPrevious': 'Anterior',"
		html << "    'sFirst': 'Primeiro',"
		html << "    'sLast': 'Último'"
		html << "},"
		html << "},"
		

		html << "'info': false,"
		html << "'searching': false,"
		html << "'ordering': false,"
		html << "'bLengthChange': false,"
		html << "'lengthMenu': [[5], [5]]"

		html <<	"});"


		html << " } );"

		html << " </script>"
		html.html_safe

	end
	end