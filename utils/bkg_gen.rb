
def generate_star(x, y, r)
    s = rand(0..3)
    d = rand(3..8)
    h = (r/2.0).round(2)
    r = r.round(2)
    c0 = [148, 128, 84, 64][rand(4)]
    c1 = c0 / 2
    return "\n\t<circle cx=\"#{x}\" cy=\"#{y}\" r=\"#{r}\" fill=\"rgb(#{c0},#{c0},#{c0})\" >
        <animate attributeName=\"r\"
            calcMode=\"spline\"
            keySplines=\"0.3 0 0.7 1;0.3 0 0.7 1\"
            values=\"#{r};#{h};#{r}\"
            keyTimes=\"0;0.5;1\"
            begin=\"#{s}s\" dur=\"#{d}s\"
            repeatCount=\"indefinite\" />
        <animate attributeName=\"fill\"
            calcMode=\"spline\"
            keySplines=\"0.3 0 0.7 1;0.3 0 0.7 1\"
            values=\"rgb(#{c0},#{c0},#{c0});rgb(#{c1},#{c1},#{c1});rgb(#{c0},#{c0},#{c0})\"
            keyTimes=\"0;0.5;1\"
            begin=\"#{s}s\" dur=\"#{d}s\"
            repeatCount=\"indefinite\" />
    </circle>"
end

def generate_svg(w, h, num_stars)
    stars = []
    (0...num_stars).each do |i|
        x = rand(16..(w - 16))
        y = rand(16..(h - 16))
        r = (rand() * 2) + 0.2
        stars << generate_star(x, y, r)
    end
    return "<?xml version=\"1.0\" standalone=\"no\"?>
<svg width=\"#{w}\" height=\"#{h}\" viewBox=\"0 0 #{w} #{h}\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">
    <title>MeteoStorm</title>
    <desc>MeteoStorm</desc>
    <!-- Black background -->
    <rect x=\"0\" y=\"0\" width=\"#{w}\" height=\"#{h}\" fill=\"black\" />
    <!-- Random stars with size & colour animations to twinkle -->#{stars.join '' }
</svg>"
end

puts generate_svg(512, 512, 250)
