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
      spiroid_image = Gosu::Image.new('assets/images/spiroid.png')

      INITIAL_SPIROID_COUNT.times do
        @spiroids << Spiroid.new(window: self,
                                  image: spiroid_image,
                                      x: (WIDTH/rand_1_to_(10)).clamp(spiroid_image.width/2, WIDTH - spiroid_image.width/2),
                                      y: (HEIGHT/rand_1_to_(10)).clamp(spiroid_image.height/2, HEIGHT - spiroid_image.height/2),
                             x_velocity: rand_1_to_(5),
                             y_velocity: rand_1_to_(5),
                       angular_velocity: rand_1_to_(6))
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

    def rand_1_to_(n)
      Random.rand(n) + 1
    end

    def draw_background
      Gosu.draw_rect(0, 0, WIDTH, HEIGHT, Gosu::Color::WHITE)
    end
  end
end
