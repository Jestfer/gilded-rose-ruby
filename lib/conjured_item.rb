class ConjuredItem < CommonItem
  def update_item
    next_day
    expiracy_check

    reduce_quality(2)
  end
end
