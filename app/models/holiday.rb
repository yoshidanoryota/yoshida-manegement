class Holiday < ActiveHash::Base
  self.data = [
    { id: 1, name: '---------休暇詳細を選択してください---------' },
    { id: 2, name: '有給休暇' },
    { id: 3, name: '有給休暇（半日）' },
    { id: 4, name: '慶弔休暇' },
    { id: 5, name: '忌引休暇' },
    { id: 6, name: '病気休暇' },
    { id: 7, name: 'リフレッシュ休暇' }
  ]

  include ActiveHash::Associations
  has_many :rests

  end