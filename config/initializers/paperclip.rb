Paperclip.interpolates :potm do |attachment, style|
  "potm_#{attachment.instance.month}_#{attachment.instance.year}"
end

Paperclip.interpolates :year do |attachment, style|
  attachment.instance.year
end

Paperclip.interpolates :month do |attachment, style|
  attachment.instance.month
end

Paperclip.interpolates :username do |attachment, style|
  attachment.instance.username
end

Paperclip.interpolates :savename do |attachment, style|
  x = []
  6.times do
    x << rand(0..9)
  end
end