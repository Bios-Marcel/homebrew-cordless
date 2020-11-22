class Cordless < Formula
    desc "Discord, but in 1984"
    homepage "https://github.com/Bios-Marcel/cordless"
    url "https://github.com/Bios-Marcel/cordless/archive/2020-11-22.tar.gz"
    version "2020-11-22"
    sha256 "51cf5aa0a24024e3305b86a615a3fde4a451622173224933bd0a80fc81661214"
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
  