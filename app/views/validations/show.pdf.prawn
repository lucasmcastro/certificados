# encoding: utf-8

image_path = Rails.root.join('app', 'assets', 'images', 'bg_certificate.jpg')
prawn_document(:page_size => [787, 1130], :page_layout => :landscape, :margin => 0) do |pdf|
  pdf.float { pdf.image image_path  }
  pdf.move_cursor_to 530
  pdf.font("Times-Bold", :size => 45)
  pdf.text "CERTIFICADO", :align => :center
  pdf.move_cursor_to 430
  pdf.font("Times-Roman", :size => 30)
  pdf.span(1000, :position => :center) do
    pdf.text "A IT Cursos certifica a participação de <b>ANA MARIA DA CAMARA COLOMBIERI</b> no curso <b>PERSONAL OFFICE</b>, com carga horária total de <b>20 HORAS</b>, realizado no período de <b>FEVEREIRO DE 2013</b> a <b>ABRIL DE 2013</b>, em Natal/RN.", :align => :center, :inline_format => true
  end
  pdf.move_down 50
  pdf.font("Times-Bold", :size => 30)
  pdf.text "Conteúdo Programático", :align => :center
  pdf.move_down 30
  pdf.font("Times-Roman", :size => 25)
  pdf.column_box([100, pdf.cursor], :columns => 2, :width => pdf.bounds.width, :height => 90) do
    pdf.text "• Algoritmos com Javascript"
    pdf.text "• Programação com PHP, HTML e CSS"
    pdf.text "• Banco de Dados com MySQL"
    pdf.text "• Projetando Sistemas Web"
    pdf.text "• Projeto Integrador"
  end

end