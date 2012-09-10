# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


subject = Subject.create name: "数学"
  course = subject.courses.create name: "初一数学(上)"
    chapter = course.chapters.create name: "第一单元：有理数"
      lesson = chapter.lessons.create name: "第一课：有理数的概念及概念性工具"
        section = lesson.sections.create name: "负数的概念",
          description: "目标：让学生通过生活中直观的例子感受负数这一概念存在的意义核能解决的问题。"
          video = VideoActivity.create type: "TextActivity", name: "视频1", duration: 183, notes: "有理数是一个相当复杂的概念。",
              thumbnail: open(File.join(File.dirname(__FILE__), "files", "video_thumb.png")),
              content_file: open(File.join(File.dirname(__FILE__), "files", "video1.mp4"))

          section.activities << video

          gallery = GalleryActivity.create type: "GalleryActivity", name: "图集1",
              thumbnail: open(File.join(File.dirname(__FILE__), "files", "gallery_thumb.png"))
          4.times do |n|
            gallery_image = gallery.images.create intro: "只是一幅简单的小情画，画出我们心中的曲折...",
              image_file: open(File.join(File.dirname(__FILE__), "files", "image#{n+1}.jpg"))
          end
          section.activities << gallery

          quiz = QuizActivity.create type: "QuizActivity", name: "小测验1"
            problem = quiz.problems.create tipe: "mc", answer: "D", body: "<p>`1+1`等于几？<p>"
              problem.problem_choices.create choice: "A", body: "你"
              problem.problem_choices.create choice: "B", body: "妹"
              problem.problem_choices.create choice: "C", body: "啊"
              problem.problem_choices.create choice: "D", body: "2"
            problem = quiz.problems.create tipe: "fb", answer: "10的20次方", body: "<p>`10^20`怎么念？<p>"
            problem = quiz.problems.create tipe: "fb", answer: "42", body: <<BODY
<p>When `a != 0`, there are two solutions to `ax^2 + bx + c = 0` and they are</p>
<p style="text-align:center">`x = (-b +- sqrt(b^2-4ac))/(2a) .`</p>
BODY
            problem = quiz.problems.create tipe: "fb", answer: "-1", body: <<BODY
<p>数轴上的点A、B分别表示数字`-3`和`1`，点C是AB的中点，则点C所表示的数是？<p>
BODY
          section.activities << quiz

    section = lesson.sections.create name: "负数的数学定义",
        description: "目标：让学生在对负数的直观理解的基础上了解负数的数学定义。"
    section = lesson.sections.create name: "负数的简单的负数使用与数轴预备概念",
        description: "目标：通过“买东西”和“温度计”等直观的性质让学生操作涉及负数的理解和简单实用的试题。"
    section = lesson.sections.create name: "数轴的概念和数学定义",
        description: "目标：让学生了解数轴产生的原因，所包含的意义。了解数轴的基本属性，能使用数轴进行基本概念的操作。"
    section = lesson.sections.create name: "相反数",
        description: "目标：学习相反数的概念，使用概念。"
    section = lesson.sections.create name: "绝对值",
        description: "目标：让学生具备对绝对值的直观理解，数学定义和概念实用的能力。"

  lesson = chapter.lessons.create name: "第二课：有理数的四则运算"
    section = lesson.sections.create name: "有理数加减法的直观理解与计算操作"
    section = lesson.sections.create name: "有理数的乘法"
    section = lesson.sections.create name: "有理数的除法"
    section = lesson.sections.create name: "有理数的四则运算的综合使用"
    section = lesson.sections.create name: "乘方的概念和使用"
    section = lesson.sections.create name: "习题课"

provider = Provider.create name: "阳光书屋", intro:"神秘组织，不崇拜星辰诸神"
Provider.create name: "天驱武士团", intro: "铁甲依然在"
Provider.create name: "辰月教", intro: "星辰与月的旗帜飘扬在九州大地上"
Provider.create name: "天罗", intro: "我躲在这里，手握着刀丝"

Tag.create name: "小学", tag_type: "对象"
Tag.create name: "中学", tag_type: "对象"
Tag.create name: "自然", tag_type: "内容"
Tag.create name: "历史", tag_type: "内容"


intro = <<DESC
    《哈利·波特与凤凰社》是“哈利·波特”系列的第五部。
　　漫长的暑假，哈利·波特被困在女贞路4号，意外地遭到摄魂怪的袭击……逃过一劫的哈利被护送到伦敦一个秘密的地方，在那里他见了自己的教父小天狼星布莱克、前任黑魔法防御术课教师卢平、疯眼汉穆迪以及他的朋友赫敏和罗恩。他只是知道邓布利多与凤凰社成员正在加紧秘密活动，以对抗日益强大的伏地魔。但是，所有的人都不愿向他透露更多的情况……
　　哈利在茫然与愤怒中来到霍格沃茨，然而令他不解的是，邓布利多不愿见他，海格不知去向。更糟糕的是，哈利越来越频繁地在梦中看见一道长长的走廊，每当他快要走进长廊尽头的一扇门时，他都会头痛欲裂地从梦中惊醒，觉得自己身体里蠕动着一条大蛇……
　　魔法部派来了一位专横跋扈的高级调查官，对学校各项事务横加干涉，并最终赶走了邓布利多校长，打伤了麦格教授，整个学校笼罩在一片混乱和压抑之中……
　　大蛇的影子在哈利的脑海里越来越清晰，伏地魔走近了哈利……这时，邓布利多告诉他一个天大的秘密……
DESC

author = Author.create name: "J.K 罗琳"

collection = BookCollection.create title: "哈利·波特与凤凰社", intro: intro
  book = collection.books.create title: "哈利·波特与凤凰社1", intro: intro, author: author, provider_id: provider.id
  book = collection.books.create title: "哈利·波特与凤凰社2", intro: intro, author: author, provider_id: provider.id
  book = collection.books.create title: "哈利·波特与凤凰社3", intro: intro, author: author, provider_id: provider.id
  book = collection.books.create title: "哈利·波特与凤凰社4", intro: intro, author: author, provider_id: provider.id
  book = collection.books.create title: "哈利·波特与凤凰社5", intro: intro, author: author, provider_id: provider.id

  collection.tags << (Tag.create name: "哈利·波特")
  collection.tags << (Tag.create name: "J.K 罗琳")
  collection.tags << (Tag.create name: "魔法")
  collection.tags << (Tag.create name: "英国")
  collection.tags << (Tag.create name: "魔幻小说", tag_type: "theme")
  
apk = Apk.create file: open(File.join(File.dirname(__FILE__), "files", "alarming.apk")), description: "尊贵的小闹钟"
apk.parse_info

apk = Apk.create file: open(File.join(File.dirname(__FILE__), "files", "Bluetooth.apk")), description: "尊贵的蓝牙"
apk.parse_info

apk = Apk.create file: open(File.join(File.dirname(__FILE__), "files", "BookMark.apk")), description: "尊贵的书签"
apk.parse_info

apk = Apk.create file: open(File.join(File.dirname(__FILE__), "files", "Browser.apk")), description: "尊贵的浏览器"
apk.parse_info

MachineType.create name: "7寸晓书", size: "800*480", android_version: "2.2"
MachineType.create name: "8寸晓书", size: "1024*768", android_version: "4.0.3"

School.create name: "阳光书屋", location: "北京市海淀区苏州街"
School.create name: "四坝九年制学校", location: "甘肃省武威市四坝镇"
School.create name: "和寨九年制学校", location: "甘肃省武威市永昌镇"
School.create name: "贺家中学", location: "湖南省衡阳市衡山县贺家乡"
School.create name: "贺家中心完小", location: "湖南省衡阳市衡山县贺家乡"

Classroom.create school_id: 2, class_of: 2018, class_order: 4

User.create name: "杨同学", birthday: "1987-12-22", school_id: 2, classroom_id: 1, user_type: "student"
User.create name: "杨老师", birthday: "1987-12-22", school_id: 2, user_type: "teacher"

Admin.create username: "admin", name: "管理员先生",  encrypted_password: "$2a$10$sx/HYIizHHYKpph6wN1dOuAIPCE/deJv3SKVMirt2f8ETkuj4KRkC",school_id: 1, is_global: true, is_manager: true, is_super: true