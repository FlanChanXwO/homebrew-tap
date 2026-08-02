class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.3.0/javdb-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "abd7006a9caff4971a7e582a202699c1a15d641ab7618662b1ffee1903d37a6b"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.3.0/javdb-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "4ed6bd48005b10b124b27dc0b4e078e7976b0e60784e27e25352f6950c7bc34d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.3.0/javdb-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "cb038b0d42c3584739747a9a73cfc5091885a50ed6951ee1529ca93b946af0ba"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.3.0/javdb-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "7c5a51e09525060276e0007e130a78ae2997bc9fe554202617c350fb544164c3"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/javdb version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
