class Touchstore < Formula
  desc "Touch ID-guarded label/value store, encrypted in the Secure Enclave"
  homepage "https://github.com/jeremywohl/touchstore"
  url "https://github.com/jeremywohl/touchstore/releases/download/v0.1.0/touchstore-v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "63cf60f8636433f61e43f520a38cb49048f2205fc279f3eee00c9d426022fcf2"
  license "MIT"

  depends_on :macos

  # Prebuilt universal binary (arm64 + x86_64), Developer ID-signed and
  # notarized. Shipping the signed binary keeps its code signature stable
  # across upgrades, so keychain items guarded by the signature's ACL don't
  # re-prompt after every update — building from source would break that.
  def install
    bin.install "touchstore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/touchstore --version")
  end
end
