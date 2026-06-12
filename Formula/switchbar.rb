class Switchbar < Formula
  desc "Quick macOS default browser switcher from the menu bar"
  homepage "https://github.com/Yukaii/Switchbar"
  url "https://github.com/Yukaii/Switchbar/archive/refs/tags/v#{version}.tar.gz"
  version "1.0.0"
  license "MIT"

  head "https://github.com/Yukaii/Switchbar.git", branch: "main"

  depends_on :xcode => :build

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/Switchbar"

    # Install launch agent plist for auto-start
    plist_path = prefix/"com.yukaii.switchbar.plist"
    plist_path.write <<~PLIST
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

  def post_install
    puts <<~EOS
      To auto-start Switchbar on login:

        cp #{opt_prefix}/com.yukaii.switchbar.plist ~/Library/LaunchAgents/
        launchctl load ~/Library/LaunchAgents/com.yukaii.switchbar.plist

      Or run it manually:

        Switchbar &
    EOS
  end

  def caveats
    <<~EOS
      Switchbar runs as a menu bar app. The keyboard shortcut
      (Option+Space by default) opens the browser switcher menu.

      Inspired by Default Browser: https://sindresorhus.com/default-browser
    EOS
  end

  test do
    assert_predicate bin/"Switchbar", :exist?
  end
end
