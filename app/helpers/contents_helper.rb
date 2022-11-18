module ContentsHelper
    def category_pulldown_list
        list = []
        Category.all.each do |c|
            list.push(c.name)
        end
        list
    end

    def item_pulldown_list(category_id)
        list = []
        Item.all.where(category_id: category_id).each do |i|
            list.push(i.name)
        end
        # [Item.new(category_id: 1, is_approved: false)]
        list.push('その他')
    end
end
