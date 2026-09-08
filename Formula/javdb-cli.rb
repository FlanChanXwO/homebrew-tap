class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.3/javdb-cli_0.7.3_darwin_arm64.tar.gz"
      sha256 "6b108b92b7aa222311d0389546f98944233b66f0ba7832624ed3848f98e30b7a"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.3/javdb-cli_0.7.3_darwin_amd64.tar.gz"
      sha256 "e2a53833323f94b527c3e4cfe79c8146e33de23746dc2f7d128288688b3751d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.3/javdb-cli_0.7.3_linux_arm64.tar.gz"
      sha256 "26d51061fb75dbb1ab7ff904f454e438e5aab3249fda3bc556df7062d6ba8d47"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.3/javdb-cli_0.7.3_linux_amd64.tar.gz"
      sha256 "061afe11e171e4a3d98756406d426684e3ea152723082b09a0efd782f434736b"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
