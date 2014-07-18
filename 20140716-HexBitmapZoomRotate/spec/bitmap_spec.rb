require_relative '../lib/bitmap'
require 'pry'

describe Bitmap do
  let(:hex_values) {["18 3C 7E 7E 18 18 18 18","FF 81 BD A5 A5 BD 81 FF","AA 55 AA 55 AA 55 AA 55","3E 7F FC F8 F8 FC 7F 3E","93 93 93 F3 F3 93 93 93"]}
  let(:output) {[
    ["   xx   ","  xxxx  "," xxxxxx "," xxxxxx ","   xx   ","   xx   ","   xx   ","   xx   "],
    ["xxxxxxxx","x      x","x xxxx x","x x  x x","x x  x x","x xxxx x","x      x","xxxxxxxx"],
    ["x x x x "," x x x x","x x x x "," x x x x","x x x x "," x x x x","x x x x "," x x x x"],
    ["  xxxxx "," xxxxxxx","xxxxxx  ","xxxxx   ","xxxxx   ","xxxxxx  "," xxxxxxx","  xxxxx "],
    ["x  x  xx","x  x  xx","x  x  xx","xxxx  xx","xxxx  xx","x  x  xx","x  x  xx","x  x  xx"]
  ]}
  let(:rotated) {[
    ["        ","    xx  ","    xxx ","xxxxxxxx","xxxxxxxx","    xxx ","    xx  ","        "],
    ["xxxxxxxx","x      x","x xxxx x","x x  x x","x x  x x","x xxxx x","x      x","xxxxxxxx"],
    [" x x x x","x x x x "," x x x x","x x x x "," x x x x","x x x x "," x x x x","x x x x "],
    ["  xxxx  "," xxxxxx ","xxxxxxxx","xxxxxxxx","xxxxxxxx","xxx  xxx","xx    xx"," x    x "],
    ["xxxxxxxx","   xx   ","   xx   ","xxxxxxxx","        ","        ","xxxxxxxx","xxxxxxxx"]
  ]}
  let(:zoom) {["xxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxx","xx            xx","xx            xx","xx  xxxxxxxx  xx","xx  xxxxxxxx  xx","xx  xx    xx  xx","xx  xx    xx  xx","xx  xx    xx  xx","xx  xx    xx  xx","xx  xxxxxxxx  xx","xx  xxxxxxxx  xx","xx            xx","xx            xx","xxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxx"]}

  context 'new' do
    it 'should create bitmap image based on hex input' do
      hex_values.each_with_index do |hex,i|
        expect(Bitmap.new(hex).image).to eq(output[i])
      end
    end
  end

  context 'rotate' do
    it 'should rotate bitmap image 90 degrees' do
      hex_values.each_with_index do |hex,i|
        expect(Bitmap.new(hex).rotate).to eq(rotated[i])
      end
    end
  end

  context 'zooming' do
    it 'should zoom IN the bitmap image 2x' do
      expect(Bitmap.new(hex_values[1]).zoomin).to eq(zoom)
    end

    it 'should zoom OUT the bitmap image 2x' do
      bit = Bitmap.new(hex_values[1])
      bit.zoomin
      expect(bit.zoomout).to eq(output[1])
    end
  end

end



