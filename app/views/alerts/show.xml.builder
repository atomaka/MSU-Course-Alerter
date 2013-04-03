xml.instruct!
xml.Response do
  xml.Say @alert.course_name + ' is now available.', :voice => 'woman'
end