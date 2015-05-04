class Task

  attr_reader(:description,:level)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @level = attributes[:level]
  end
end
