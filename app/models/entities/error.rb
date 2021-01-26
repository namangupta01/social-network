module Entities
  class Error
    attr_accessor :message, :code
    def initialize code, message
      # self.code = code
      # self.message = message
      puts self.message
    end
  end
end
