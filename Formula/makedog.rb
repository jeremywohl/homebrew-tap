class Makedog < Formula
  desc "Runner for server binaries: restart on builds, log runs, send signals"
  homepage "https://github.com/jeremywohl/makedog"
  url "https://github.com/jeremywohl/makedog/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./src"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/makedog --version")
  end
end
