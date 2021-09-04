class Kiryoku < ActiveHash::Base
 self.data = [
   { id: 1, name: '--' },
   { id: 2, name: 'アマ5級以下' },
   { id: 3, name: 'アマ4級' },
   { id: 4, name: 'アマ3級' },
   { id: 5, name: 'アマ2級' },
   { id: 6, name: 'アマ1級' },
   { id: 7, name: 'アマ初段' },
   { id: 8, name: 'アマ2段' },
   { id: 9, name: 'アマ3段' },
   { id: 10, name: 'アマ4段以上' }
 ]

 include ActiveHash::Associations
 has_many :users, dependent: :destroy
 has_many :games, dependent: :destroy
 end