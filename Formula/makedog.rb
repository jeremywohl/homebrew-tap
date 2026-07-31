class Makedog < Formula
  desc "Runner for server binaries: restart on builds, log runs, send signals"
  homepage "https://github.com/jeremywohl/makedog"
  url "https://github.com/jeremywohl/makedog/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "7c98510185b8390774000af8939c452b310d31ed8a6b9cff5e380954c1627e73"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./src"
    man1.install "doc/makedog.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/makedog --version")
  end
end
