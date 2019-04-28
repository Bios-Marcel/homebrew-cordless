class Cordless < Formula
    desc "Discord, but in 1984"
    homepage "https://github.com/Bios-Marcel/cordless"
    url "https://github.com/Bios-Marcel/cordless/archive/2019-04-17.tar.gz"
    version "2019-04-17"
    sha256 "d75f62cb8675f894d0a566e7ad156c0fe1717882b3fb1b57a89694466197a12f"
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
  