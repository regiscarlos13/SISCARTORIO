module ApplicationHelper

	include LoadFile

def formated_cpf(number)
	number.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
end

def formated_phone(number)
	number.gsub(/(?!^\+)\D*/, '')
end

def date_or_blank(field)
	field.blank? ? '-' : field.strftime("%d/%m/%Y") 	
end

def field_tp(field)
	if field == 'PORTARIA'
		content_tag(:span, field, class: 'badge badge-success')
	else
		content_tag(:span, field, class: 'badge badge-danger')
	end
end

def situation_procedimento(field)
	if field == 'Em Andamento'
		content_tag(:span, 'Em Andamento', class: 'badge badge-danger')
	elsif field == 'Arquivado'
		content_tag(:span, 'Arquivado', class: 'badge badge-success')
	elsif field == 'Transferido'
		content_tag(:span, 'Tranferido', class: 'badge badge-info')
	else
		content_tag(:span, 'Convertido', class: 'badge badge-secondary')

	end
end
end
