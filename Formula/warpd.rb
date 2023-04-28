class Warpd < Formula
    desc "A modal keyboard driven interface for mouse manipulation"
    homepage "https://github.com/rvaiya/warpd"
    url "https://github.com/rvaiya/warpd/releases/download/v1.3.5/warpd-1.3.5-osx.tar.gz"
    sha256 "4a4bbaeb3a864cd45b3d3bd841bdd87dc67b2099b860da18b81efb23d28afb2b"
    version "1.3.5"
    head "https://github.com/rvaiya/warpd.git", branch: "master"
  
    depends_on :macos
    depends_on xcode: :build if build.head?
  
    def install
    if build.head?
        system "make"
        bin.install "bin/warpd"
        man1.install "files/warpd.1.gz"
    else
        bin.install "usr/local/bin/warpd"
        man1.install "usr/local/share/man/man1/warpd.1.gz"
      end
      (prefix/"Library/LaunchAgents").install "Library/LaunchAgents/com.warpd.warpd.plist"
    end
    
    service do
        run [opt_bin/"warpd", "-f"]
        keep_alive true
        process_type :interactive
    end

    test do
        system "#{bin}/warpd", "--version"
    end
  end