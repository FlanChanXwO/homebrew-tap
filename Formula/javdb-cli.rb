class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.3/javdb-cli_0.8.3_darwin_arm64.tar.gz"
      sha256 "d4d78e749f4264a89ecd5cbcab11e26ff404260a6da4d49bc97e67898cdd3b4e"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.3/javdb-cli_0.8.3_darwin_amd64.tar.gz"
      sha256 "c0fc25a42f83c4cb2d78cd483b50e4d8bb5e73a6663bde7886c3aa665c7d7e30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.3/javdb-cli_0.8.3_linux_arm64.tar.gz"
      sha256 "8a427402c954b3bc893721b6e631259125322aa44595bee71b0c9650a450b9c0"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.3/javdb-cli_0.8.3_linux_amd64.tar.gz"
      sha256 "8e527cd44b7d85115f6b2f6994bb0297bdb55700361f356ac231e7db6b4af934"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
