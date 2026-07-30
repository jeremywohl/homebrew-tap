class Makedog < Formula
  desc "Runner for server binaries: restart on builds, log runs, send signals"
  homepage "https://github.com/jeremywohl/makedog"
  url "https://github.com/jeremywohl/makedog/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PENDING_FIRST_RELEASE"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./src"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/makedog --version")
  end
end
