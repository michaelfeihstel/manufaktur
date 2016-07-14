class LineItemPresenter
  def initialize(line_item, view_context=nil)
    @line_item = line_item
    @view = view_context
  end

  def size_list
    line_item.product.size_set.sizes.each do |size|
      view.content_tag :li do
        view.concat(view.content_tag :label, line_item&.product&.size_set&.send(size), class: "label--small")
        view.concat(view.content_tag :div, line_item&.send(size),
          class: ("backordered" if line_item&.backorders&.send(size)),
            data: { tooltip: line_item&.backorders&.send(size) }
        )
      end
    end
  end

  def size_item(size)
    view.content_tag :li do
      view.concat(view.content_tag :label, line_item&.product&.size_set&.send(size), class: "label--small")
      view.concat(view.content_tag :div, line_item&.send(size), class: ("backordered" if line_item&.backorders&.send(size)))
    end
  end

  private
  attr_reader :line_item, :view
end