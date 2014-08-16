class Post < Sequel::Model

  many_to_one :channel

  self.dataset_module do
    def sorted_by_date
      order(Sequel.desc(:created_at))
    end
    def created_after(some_date)
      where { created_at > some_date }
    end
  end

end
