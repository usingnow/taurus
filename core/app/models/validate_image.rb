require 'rubygems'

class ValidateImage
  include Magick
  attr_reader :code, :code_image
  Jiggle = 15
  Wobble = 15

  def initialize(len)
    chars = ('a'..'z').to_a - ['a','e','i','o','u']
    code_array=[]
    #随机生成验证码字母
    1.upto(len) {code_array << chars[rand(chars.length)]}
    #生成granite样式的背景
    granite = Magick::ImageList.new('xc:#EDF7E7')
    #定义画布
    canvas = Magick::ImageList.new
    #将granite添加到画布上
    canvas.new_image(32*len, 50, Magick::TextureFill.new(granite))
    #定义文字
    text = Magick::Draw.new
    #定义文字字体
    text.font_family = 'times'
    #定义文字大小
    text.pointsize = 40
    cur = 10
    code_array.each{|c|
    rand(10) > 5 ? rot=rand(Wobble) : rot= -rand(Wobble)
    rand(10) > 5 ? weight = NormalWeight : weight = BoldWeight
    #将text对象添加到canvas上
    text.annotate(canvas,0,0,cur,30+rand(Jiggle),c){
    self.rotation=rot #旋转角度
    self.font_weight = weight #text（文字）大小
    self.fill = 'green' #text（文字）颜色
    }
    cur += 30
    }
    #生成验证码文字（将数组转换为字符串）
    @code = code_array.join('')
    #生成二进制图片
    @code_image = canvas.to_blob{
    self.format="JPG"
    }
  end
end