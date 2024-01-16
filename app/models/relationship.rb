class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" # 構文ミス
  belongs_to :followed, class_name: "User" # 構文ミス
end
