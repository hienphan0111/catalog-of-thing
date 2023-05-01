require_relative './app/app'

class Main
  app = App.new

  key = ''

  until key == '12'
    app.show_menu
    key = gets.chomp
    app.run(key)
  end
  puts 'Thanks for using app'
end
