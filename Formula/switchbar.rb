class Switchbar < Formula
  desc "Quick macOS default browser switcher from the menu bar"
  homepage "https://github.com/Yukaii/Switchbar"
  version "1.0.1"
  license "MIT"
  url "https://github.com/Yukaii/Switchbar/releases/download/v1.0.1/Switchbar-v1.0.1-arm64.tar.gz"
  sha256 "dce164cf11c32d8cfd0d8f05ec8dfaf681b086078ae38b7ec532f5190968be6e"

  head "https://github.com/Yukaii/Switchbar.git", branch: "main"

  depends_on :xcode => :build

  def install
    if build.head?
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/Switchbar"
    else
      bin.install "Switchbar"
    end
  end

  service do
    run [opt_bin/"Switchbar"]
    run_type :immediate
  end

  def caveats
    <<~EOS
      Switchbar runs as a menu bar app. The keyboard shortcut
      (Option+Space by default) opens the browser switcher menu.

      To auto-start on login:

        brew services start yukaii/tap/switchbar

      Inspired by Default Browser: https://sindresorhus.com/default-browser
    EOS
  end

  test do
    assert_predicate bin/"Switchbar", :exist?
  end
end
