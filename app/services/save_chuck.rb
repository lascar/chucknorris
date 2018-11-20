class SaveChuck
  include Callable

  def initialize(chuck)
    @chuck = chuck
  end

  def call
    category = @chuck['category']
    chuck = Chuck.create(chuck_id: @chuck['id'], category: category ? category[0] : '', 
     value: @chuck['value'])
    return chuck
  end
end
