class Cordless < Formula
    desc "Discord, but in 1984"
    homepage "https://github.com/Bios-Marcel/cordless"
    url "https://github.com/Bios-Marcel/cordless/archive/2020-01-05.tar.gz"
    version "2020-01-05"
    sha256 "ca86d772a5e00f915e63078ababfd6f96acdae4b251fe7b9e1e4fe9eb3c5bed9"
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
  