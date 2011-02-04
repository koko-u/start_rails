# -*- coding: utf-8 -*-
names = [
  "切手を買う",
  "報告書を書く",
  "家賃を払う",
  "猫の餌を買う",
  "燃えないゴミを出す"
]

description = "これは説明です。" * 20

names.each_with_index do |name, i|
  Task.create(:name => name, :description => description,
              :due_date => (i-2).days.from_now, :done => i.zero?
              )
end
