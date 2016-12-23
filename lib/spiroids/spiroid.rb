module Spiroids
  class Spiroid
    attr_reader :x, :y, :x_velocity, :y_velocity, :angle, :image

    Z_ORDER = 1

    def initialize(window:, x:, y:, x_velocity: 0, y_velocity: 0, angle: 0)
      @window = window
      @x = x
      @y = y
      @x_velocity = x_velocity
      @y_velocity = y_velocity
      @angle = angle
      @image = Gosu::Image.new("assets/images/spiroid.png")
    end

    def update
      @angle -= 2
      @angle %= 360

      @x += x_velocity
      @x_velocity = -x_velocity if at_x_edge?

      @y += y_velocity
      @y_velocity = -y_velocity if at_y_edge?
    end

    def draw
      @image.draw_rot(x, y, Z_ORDER, angle)
    end

    private
    attr_reader :window
    def at_x_edge?
      (x + image.width/2) > window.width || (x - image.width/2) < 0
    end
    
    def at_y_edge?
      (y + image.height/2) > window.height || (y - image.height/2) < 0
    end
  end
end
