# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_one = User.create(uid: "100008485861613")
user_two = User.create(uid: "100006874927353")
user_three = User.create(uid: "100006382939031")
user_four = User.create( uid: "100004294879183")
user_five = User.create( uid: "100007158439158")
user_six = User.create( uid: "100006624499145")
#user_seven = User.create({ uid: "100005048959100"})
#user_eight = User.create({ uid: "100004863379024"})
#user_nine = User.create({ uid: "1520711264843609"})
#user_ten = User.create({ uid: "100006374464624"})

a_1 = Advice.create(url: "http://www.popsugar.com/fitness/Yoga-Sciatica-23949884")
a_2 = Advice.create(url: "http://www.shape.com/lifestyle/mind-and-body/6-imbalances-cause-painand-how-fix-them")
a_3 = Advice.create(url: "http://greatist.com/move/yoga-healthy-hips")
a_4 = Advice.create(url: "http://www.bewellbydrfranklipman.com/healthy-living/exercise.html")
a_5 = Advice.create(url: "http://breakingmuscle.com/mobility-recovery/its-all-in-the-hip-5-steps-to-fixing-movement-dysfunction")
#@advice = Advice.create(url: "")
a_1.tag_list.add("sciatia, yoga, hips", :parse => true)
a_2.tag_list.add("imbalance, hip pain, hips", :parse => true)
a_3.tag_list.add("yoga, tight hips, hips", :parse => true)
a_4.tag_list.add("piriformis, sciatia, tight hips, hips",:parse => true)
a_5.tag_list.add("hips, hip dysfunction, hip injury, hip pain", :parse => true)

a_1.save
a_2.save
a_3.save
a_4.save
a_5.save

users = [user_one, user_two, user_three, user_four, user_five, user_six]

users.each do |user|
  binding.pry
  user.user_advices.create(advice_id: a_1.id)
  user.user_advices.create(advice_id: a_2.id)
  user.user_advices.create(advice_id: a_3.id)
  user.user_advices.create(advice_id: a_4.id)
  user.user_advices.create(advice_id: a_5.id)
end



