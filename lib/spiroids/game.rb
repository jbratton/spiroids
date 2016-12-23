module Spiroids
  class Game < Gosu::Window
    WIDTH = Gosu.screen_width
    HEIGHT = Gosu.screen_height
    CAPTION = 'Spiroids'
    INITIAL_SPIROID_COUNT = 40

    def initialize
      super(WIDTH, HEIGHT)
      self.caption = CAPTION

      @spiroids = []
    end

    def begin!
      INITIAL_SPIROID_COUNT.times do
        @spiroids << Spiroid.new(window: self,
                                      x: WIDTH/(Random.rand(10) + 1),
                                      y: HEIGHT/(Random.rand(10) + 1),
                             x_velocity: Random.rand(5),
                             y_velocity: Random.rand(5))
      end
      show
    end

    def update
      spiroids.each(&:update)
    end

    def draw
      draw_background
      spiroids.each(&:draw)
    end

    private
    attr_reader :spiroids

    def draw_background
      Gosu.draw_rect(0, 0, WIDTH, HEIGHT, Gosu::Color::WHITE)
    end
  end
end
