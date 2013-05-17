require "./lib/ant.rb"
require "minitest/spec"
require "minitest/autorun"
require "pry"

describe Ant do
  before do
    @ant = Ant.new
  end

  describe "when turning" do
    it "should turn right on white squares" do
      @ant.move
      @ant.direction.must_equal :west
    end

    it "should turn left on black squares" do
      @ant.plane.at(Position.new(@ant.plane,50,51)).toggle_color
      @ant.move
      @ant.direction.must_equal :east
    end
  end

  describe "when moving" do
    it "should move forward 1 space only" do
      @ant.position.x.must_equal 50
      @ant.position.y.must_equal 50

      @ant.move

      @ant.position.x.must_equal 50
      @ant.position.y.must_equal 51
    end
  end

  describe "final state of the plane" do
    it "should mirror a 100x100 plane's completion state" do
      final_plane = File.open("test/fixtures/plane.txt", "rb").read
      @ant.run.plane.to_s.must_equal final_plane
    end
  end
end

