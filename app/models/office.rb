class Office < ActiveHash::Base
  self.data = [
    { id: 1, name: '----------役職を選択してください----------' },
    { id: 2, name: '一般' },
    { id: 3, name: '主任' },
    { id: 4, name: '係長' },
    { id: 5, name: '課長代理' },
    { id: 6, name: '課長' },
    { id: 7, name: '次長' },
    { id: 8, name: '部長' },
    { id: 9, name: '本部長' },
    { id: 10, name: 'その他（上記に該当しない方はこちらを選択してください）' }
  ]

  include ActiveHash::Associations
  has_many :users

  end