class Warpd < Formula
  desc 'A modal keyboard driven interface for mouse manipulation'
  homepage 'https://gitlab.com/Yukaii/warpd'
  head 'https://gitlab.com/Yukaii/warpd.git', branch: 'master'

  depends_on :macos
  depends_on xcode: :build

  def install
    system 'make'
    bin.install 'bin/warpd'
    man1.install 'files/warpd.1.gz'
    (prefix / 'Library/LaunchAgents').install 'files/com.warpd.warpd.plist'
  end

  service do
    run [opt_bin / 'warpd', '-f']
    keep_alive true
    process_type :interactive
  end

  test do
    system "#{bin}/warpd", '--version'
  end
end
