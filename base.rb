module App
  
  class Base < Sinatra::Base

    def self.require_all(dir, opts={})
      
      Dir["./#{dir}/*.rb"].each do |f|
        next if opts[:but] && 
        f.include?(opts[:but])
        begin
          eval File.read f
        rescue Exception => e
          msg = e.message + " in #{f}."
          raise e.class.new msg
        end
      end
      
    end
    
  end

end