# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


type = {text: 0, audio: 1, video: 2, gallery: 3, quiz: 4, html: 5}

subject = Subject.create name: "数学"
  course = subject.courses.create name: "初一数学(上)"
    chapter = course.chapters.create name: "第一单元：有理数"
      lesson = chapter.lessons.create name: "第一课：有理数的概念及概念性工具"
        section = lesson.sections.create name: "负数的概念", description: "目标：让学生通过生活中直观的例子感受负数这一概念存在的意义核能解决的问题。"
          
    section = lesson.sections.create name: "负数的数学定义", description: "目标：让学生在对负数的直观理解的基础上了解负数的数学定义。"
    section = lesson.sections.create name: "负数的简单的负数使用与数轴预备概念", description: "目标：通过“买东西”和“温度计”等直观的性质让学生操作涉及负数的理解和简单实用的试题。"
    section = lesson.sections.create name: "数轴的概念和数学定义", description: "目标：让学生了解数轴产生的原因，所包含的意义。了解数轴的基本属性，能使用数轴进行基本概念的操作。"
    section = lesson.sections.create name: "相反数", description: "目标：学习相反数的概念，使用概念。"
    section = lesson.sections.create name: "绝对值", description: "目标：让学生具备对绝对值的直观理解，数学定义和概念实用的能力。"

  lesson = chapter.lessons.create name: "第二课：有理数的四则运算"
    section = lesson.sections.create name: "有理数加减法的直观理解与计算操作"
    section = lesson.sections.create name: "有理数的乘法"
    section = lesson.sections.create name: "有理数的除法"
    section = lesson.sections.create name: "有理数的四则运算的综合使用"
    section = lesson.sections.create name: "乘方的概念和使用"
    section = lesson.sections.create name: "习题课"
    
Provider.create name: "阳光书屋", intro:"神秘组织，不崇拜星辰诸神"
Provider.create name: "天驱武士团", intro: "铁甲依然在"
Provider.create name: "辰月教", intro: "星辰与月的旗帜飘扬在九州大地上"
Provider.create name: "天罗", intro: "我躲在这里，手握着刀丝"

Tag.create name: "小学", tag_type: "对象"
Tag.create name: "中学", tag_type: "对象"
Tag.create name: "自然", tag_type: "内容"
Tag.create name: "历史", tag_type: "内容"

