class Record < ActiveRecord::Base
  default_scope { order('date') }
end
