require_relative './app/app'

class Main
  app = App.new

  key = ''

  until key == '10'
    app.show_menu
    key = gets.chomp
    app.run(key) unless key == '10'
  end
  puts 'Thanks for using app'
end
