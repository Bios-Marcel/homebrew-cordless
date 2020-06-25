class Cordless < Formula
    desc "Discord, but in 1984"
    homepage "https://github.com/Bios-Marcel/cordless"
    url "https://github.com/Bios-Marcel/cordless/archive/.tar.gz"
    version ""
    sha256 "9ccec588519ffaaaf869f519223c8cb38f22437e38829c891c32f7d42af97f96"
    head "https://github.com/Bios-Marcel/cordless.git"
  
    depends_on "go" => :build
    depends_on "pngpaste" => :recommended
  
    def install
      ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
      (buildpath/"src/github.com/Bios-Marcel/cordless").install buildpath.children
      cd "src/github.com/Bios-Marcel/cordless" do
        system "go", "build", "-o", bin/"cordless"
        prefix.install_metafiles
      end
    end
  
    test do
      system "true"
    end
  end
  