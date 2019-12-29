def create_table(table_name, args = {})
  args[:options] = ["ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", args[:options]].compact.join(' ')
  super(table_name, args) do |t|
    yield(t)
    t.timestamps
  end
end