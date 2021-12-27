class Account < ApplicationRecord
    validates :income_or_payment,{presence:true}
    validates :amount,{presence:true}
    validates :date,{presence:true}
    validates :category_1,{presence:true}
    validates :user_id,{presence:true}
end
