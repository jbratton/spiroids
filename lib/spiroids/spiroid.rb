module Spiroids
  class Spiroid
    attr_reader :x, :y, :x_velocity, :y_velocity, :angle, :angular_velocity

    Z_ORDER = 1

    def initialize(window:, image:, x:, y:, x_velocity: 2, y_velocity: 2, angle: 0, angular_velocity: 2)
      @window = window
      @image = image
      @x = x
      @y = y
      @x_velocity = x_velocity
      @y_velocity = y_velocity
      @angle = angle
      @angular_velocity = angular_velocity
    end

    def update
      @angle += angular_velocity
      @angle %= 360

      @x += x_velocity
      if (at_x_edge?)
        @x_velocity = -x_velocity
        @angular_velocity = -angular_velocity
      end

      @y += y_velocity
      if (at_y_edge?)
        @y_velocity = -y_velocity
        @angular_velocity = -angular_velocity
      end
    end

    def draw
      @image.draw_rot(x, y, Z_ORDER, angle)
    end

    private
    attr_reader :window, :image
    def at_x_edge?
      (x + image.width/2) > window.width || (x - image.width/2) < 0
    end
    
    def at_y_edge?
      (y + image.height/2) > window.height || (y - image.height/2) < 0
    end
  end
end
