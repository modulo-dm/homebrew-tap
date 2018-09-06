class Modulo < Formula
  desc "source-only dependency manager"
  homepage "https://github.com/modulo-dm/modulo"
  url "https://github.com/modulo-dm/modulo/archive/v0.6.3.tar.gz"
  sha256 "21a1c1fba22103d5c8a7b4628f2313861c6c5ec75a0c8e679c42b44c4e42fb43"

  depends_on :xcode => "9.4.1"

  def install
    xcodebuild "build", "-project", "modulo.xcodeproj", "-scheme", "modulo", "-configuration", "Release", "SYMROOT=build"
    bin.install "/tmp/modulo"
    man1.install "Documentation/modulo.1"
    man1.install "Documentation/modulo-layout.1"
    man1.install "Documentation/modulo-init.1"
    man1.install "Documentation/modulo-add.1"
    man1.install "Documentation/modulo-update.1"
  end

  test do
    system "#{bin}/modulo", "--help"
  end
end
