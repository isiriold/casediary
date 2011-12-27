

 box = pdf.bounds
 pdf.bounding_box([0, pdf.bounds.top], :width => 600) do
    pdf.font "Courier"
    content = @letter.content
    content.gsub!(/@client/, @client.name) 
    content.gsub!(/@address/, @client.address)
    content.gsub!(/@phone_number/, @client.phone_number)
    pdf.text "#{content}", :size => 14
 end



