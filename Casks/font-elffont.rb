cask "font-elffont" do
  version "1.0.0"
  sha256 "efb1cbccaffe81a4da05615a23944663caafde79f2af5d7e5f67148ea7d66b88"

  url "https://github.com/justfont/Elffont/archive/refs/tags/v1.0.zip",
      verified: "github.com/justfont/Elffont/"

  name "Elffont"
  desc "Elven-inspired font family including Fern and Rock styles"
  homepage "https://github.com/justfont/Elffont"

  font "Elffont-1.0/fonts/elffont-fern.otf"
  font "Elffont-1.0/fonts/elffont-rock.otf"
end
