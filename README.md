### 可以先写DSL或者是 应用的API, 根据DSL的样子去猜测Gem的源码的样子

```ruby
puts -> {
  require 'ostruct'
  def create_table(*args, &block)
    puts "=======#{args}====="
    t = OpenStruct.new
    def t.string(*aaa)
      puts "^^^^^^^#{aaa}^^^^^"
    end
    puts "------#{block.call(t)}------" #=> ^^^^^^^["Name", {:limit=>256, :null=>false}]^^^^^
  end
  def add_index(*args, &block)
    puts "1111=======#{args}====="
    puts "1111------#{block}------"
  end
  module ActiveRecord
    module Schema
      def self.define(version, &block)
        block.call
      end
    end
  end
  schema_str = File.read('./registry_schema.rb')
  eval schema_str
}[]

################

ActiveRecord::Schema.define(version: 20151009092651) do

  create_table "Affiliate", primary_key: "AffiliateId", force: true do |t|
    t.string   "Name",               limit: 256,                 null: false
    t.boolean  "IsDeleted",                      default: false, null: false
    t.datetime "CreatedDate",                                    null: false
    t.string   "CreatedBy",          limit: 100
    t.datetime "ModifiedDate"
    t.string   "ModifiedBy",         limit: 100
    t.string   "AffiliateCode",      limit: 256
    t.string   "AffiliateUrl",       limit: 256
    t.string   "Description",        limit: 256
  end

end

```

