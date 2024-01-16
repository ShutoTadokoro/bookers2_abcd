class BookComment < ApplicationRecord
    belongs_to :user
    belongs_to :book
    
    validates :body, presence: true # 指定カラム「comment」が存在しないので変更
end
