require './lib/database_connection'

def select_connection
   if ENV['ENVIRONMENT'] == 'test'
    DBConn.setup('bookmark_manager_test')
  else
    DBConn.setup('bookmark_manager')
  end
end
