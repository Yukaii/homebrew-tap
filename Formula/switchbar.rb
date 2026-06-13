class Switchbar < Formula
  desc "Quick macOS default browser switcher from the menu bar"
  homepage "https://github.com/Yukaii/Switchbar"
  version "1.0.0"
  license "MIT"
  url "https://github.com/Yukaii/Switchbar/releases/download/v1.0.0/Switchbar-v1.0.0-arm64.tar.gz"
  sha256 "2836d79c8f39a8d4615f41e2462a983e7f4f6b0a3cb4d171f17cdd62ddd458e2"

  head "https://github.com/Yukaii/Switchbar.git", branch: "main"

  depends_on :xcode => :build

  def install
    if build.head?
      system "swift", "build", "-c", "release"
      bin.install ".build/release/Switchbar"
    else
      bin.install "Switchbar"
    end
  end

  def post_install
    (prefix/"com.yukaii.switchbar.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>com.yukaii.switchbar</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/Switchbar</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <false/>
      </dict>
      </plist>
    PLIST
  end

  def caveats
    <<~EOS
      Switchbar runs as a menu bar app. The keyboard shortcut
      (Option+Space by default) opens the browser switcher menu.

      To auto-start on login:

        cp #{opt_prefix}/com.yukaii.switchbar.plist ~/Library/LaunchAgents/
        launchctl load ~/Library/LaunchAgents/com.yukaii.switchbar.plist

      Inspired by Default Browser: https://sindresorhus.com/default-browser
    EOS
  end

  test do
    assert_predicate bin/"Switchbar", :exist?
  end
end
