class Cordless < Formula
    desc "Discord, but in 1984"
    homepage "https://github.com/Bios-Marcel/cordless"
    url "https://github.com/Bios-Marcel/cordless/archive/2019-06-13.tar.gz"
    version "2019-06-13"
    sha256 "ef9c4db21b7c75a5263281ed783c905b47e752f8b596575e0a41cd6e7d450566"
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
  