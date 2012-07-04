After do |scenario|
  if scenario.failed?
    save_and_open_page
      #page.save_page
  end
end
