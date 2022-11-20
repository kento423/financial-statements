module ContentsHelper
    def category_pulldown_hash
        hash = {}
        Category.all.each do |c|
            hash.store(c.name, c.id)
        end
        hash
    end

    def item_pulldown_hash(category_id)
        hash = {}
        Item.all.each do |i|
            hash.store(i.name, i.id)
        end
        hash.store('その他', nil)
        hash
    end
end
