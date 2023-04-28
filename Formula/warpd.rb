class Warpd < Formula
    desc "A modal keyboard driven interface for mouse manipulation"
    homepage "https://github.com/rvaiya/warpd"
    url "https://github.com/rvaiya/warpd/releases/download/v1.3.5/warpd-1.3.5-osx.tar.gz"
    sha256 "4a4bbaeb3a864cd45b3d3bd841bdd87dc67b2099b860da18b81efb23d28afb2b"
    version "1.3.5"
    head "https://github.com/rvaiya/warpd.git", branch: "main"
  
    depends_on :macos
    depends_on xcode: :build if build.head?
  
    def install
      if build.head?
        system "make"
        bin.install "warpd"
        man1.install "warpd.1"
      else
        bin.install "warpd"
        man1.install "warpd.1"
      end
      plist_path.write startup_plist
      prefix.install_symlink plist_path => "#{plist_name}.plist"
    end
  
    plist_options manual: "warpd"
  
    def plist_name
      "com.warpd.warpd"
    end
  
    def plist_path
      prefix/"#{plist_name}.plist"
    end
  
    def startup_plist
      <<~EOS
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/warpd</string>
          </array>
          <key>KeepAlive</key>
          <true/>
          <key>RunAtLoad</key>
          <true/>
        </dict>
        </plist>
      EOS
    end
  
    test do
      system "#{bin}/warpd", "--version"
    end
  end
  