class Modulo < Formula
  desc "source-only dependency manager"
  homepage "https://github.com/modulo-dm/modulo"
  url "https://github.com/modulo-dm/modulo/archive/v0.7.0.tar.gz"
  sha256 "081700b316b7a7c42b18771c94835bf5b8f8fbb56d6e659f8b2ad1f669b076f0"

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
