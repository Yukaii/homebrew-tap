class Warpd < Formula
  desc 'A modal keyboard driven interface for mouse manipulation'
  homepage 'https://github.com/Yukaii/warpd'
  head 'https://github.com/Yukaii/warpd.git', branch: 'master'

  depends_on :macos
  depends_on xcode: :build

  def install
    system 'make'
    bin.install 'bin/warpd'
    (share / 'warpd').install 'bin/warpd-url-handler.app'
    man1.install 'files/warpd.1.gz'
    (prefix / 'Library/LaunchAgents').install 'files/com.warpd.warpd.plist'
  end

  def caveats
    <<~EOS
      To enable warpd:// deep links, register the URL handler:

        /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
          -f #{share}/warpd/warpd-url-handler.app
    EOS
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
