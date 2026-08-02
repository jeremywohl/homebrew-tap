class Touchstore < Formula
  desc "Touch ID-guarded label/value store, encrypted in the Secure Enclave"
  homepage "https://github.com/jeremywohl/touchstore"
  url "https://github.com/jeremywohl/touchstore/releases/download/v0.5.0/touchstore-v0.5.0.tar.gz"
  version "0.5.0"
  sha256 "e68aaa7ffbede3a4e75ae802b8b7a5c58d99689b9493ac9d45db7689d2102209"
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
