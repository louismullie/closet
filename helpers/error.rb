def error(error_msg)
  halt haml :error, locals: { error_msg: error_msg }
end