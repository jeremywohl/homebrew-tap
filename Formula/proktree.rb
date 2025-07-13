class Proktree < Formula
  desc "Print your processes as a tree, nicely displayed"
  homepage "https://github.com/jeremywohl/proktree"
  url "https://github.com/jeremywohl/proktree/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2d206a31ea0ebcb77235726560f0b1b31b9e64be81483f8699d64e6eebe91a56"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"proktree"
    man1.install "proktree.1"
  end

  test do
    # Test that the binary runs and shows help
    assert_match "Print your processes as a tree", shell_output("#{bin}/proktree --help")
    
    # Test basic functionality (will show at least the shell process)
    output = shell_output("#{bin}/proktree")
    assert_match(/PID\s+USER\s+%CPU\s+%MEM\s+RSS\s+START\s+TIME\s+COMMAND/, output)
  end
end
