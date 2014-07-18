require 'pry'

class Bitmap
  attr_reader :image

  def initialize hex
    @image = hex.split(' ').map do |n|
      n.hex.to_s(2).rjust(8, '0').gsub(/[01]/, '0' => ' ', '1' => 'x')
    end
  end

  def output
    @image.join("\n")
  end

  def rotate
    @image = @image.map{|s| s.split('')}.transpose.map(&:reverse).map(&:join)
  end

  def zoomin
    @image = @image.map { |l| [l.split('').map { |c| [c]*2 }.flatten.join]*2 }.flatten
  end

  def zoomout
    zoomed = []

    @image.each_with_index.map do |l,x|
      zoomed << l.split('').each_with_index.map { |c,y| c if y.odd? }.join if x.odd?
    end

    @image = zoomed
  end

end
