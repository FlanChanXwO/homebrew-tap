class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.4/javdb-cli_0.8.4_darwin_arm64.tar.gz"
      sha256 "1adb93ba2fa3e43371c3207c97a0416cc5b5d64c6f03699f3ea9f399530cfaf7"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.4/javdb-cli_0.8.4_darwin_amd64.tar.gz"
      sha256 "1dc8971d9428e2161bfc7942263c7a120dcb16dd942ac9395aec4abd69d449f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.4/javdb-cli_0.8.4_linux_arm64.tar.gz"
      sha256 "d953d0e53f23cbf8d3afcba19d2c41b8605a9135c91bd51cec0ef1b0557becd3"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.4/javdb-cli_0.8.4_linux_amd64.tar.gz"
      sha256 "84ad666dcc7f8279b61afe7c34f6bd580c30d0e326c3c7dc69fc23948cdb0718"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
