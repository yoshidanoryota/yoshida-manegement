class Arrive < ActiveHash::Base
  self.data = [
    { id: 1, name: '---------出勤時間を選択してください---------' },
    { id: 2, name: '9:00~（通常出勤）' },
    { id: 3, name: '9:00~（在宅勤務）' },
    { id: 4, name: '7:30~（時差出勤）' },
    { id: 5, name: '10:30~(時差出勤）' },
    { id: 6, name: '13:00~(午後出勤）' }
  ]

  include ActiveHash::Associations
  has_many :attendances

  end