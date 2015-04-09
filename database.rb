def database
  @database ||= {}
end

def set(name, value)
  if database.has_key?(name) 
    database[name] << value
  else
    database.store(name, [value])
  end
end

def get(name)
  database[name][-1]
end

def unset(name)
  database.delete(name)
end

def numequalto(number)
  database.select {|key, value| value[-1] == number }.count
end
 