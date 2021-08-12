class Division < ActiveHash::Base
  self.data = [
    { id: 1, name: '-------所属部署を選択してください-------' },
    { id: 2, name: '営業部' },
    { id: 3, name: 'システム部' },
    { id: 4, name: '人事部' },
    { id: 5, name: '総務部' },
    { id: 6, name: '経理部' },
    { id: 7, name: 'マーケティング部' },
    { id: 8, name: '製造部' },
    { id: 9, name: '事業部' },
    { id: 10, name: 'その他（上記に該当しない方はこちらを選択してください）' }
  ]

  include ActiveHash::Associations
  has_many :users

  end