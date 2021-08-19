class Off < ActiveHash::Base
  self.data = [
    { id: 1, name: '---------退勤時間を選択してください---------' },
    { id: 2, name: '17:30 (通常出勤）' },
    { id: 3, name: '17:30 (在宅勤務）' },
    { id: 4, name: '16:00 (時差出勤）' },
    { id: 5, name: '19:00 (時差出勤）' },
    { id: 6, name: '12:00 (午後休暇）' }
  ]

  include ActiveHash::Associations
  has_many :outs

  end