class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.5/javdb-cli_0.8.5_darwin_arm64.tar.gz"
      sha256 "8159a703c7afbbb05476f5cd0a99949dfdbe217947bf90b3aebf398af2494236"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.5/javdb-cli_0.8.5_darwin_amd64.tar.gz"
      sha256 "cf874440a187a38d5718dc001151fe946a2239a79f9d73016b8a83a44ad13756"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.5/javdb-cli_0.8.5_linux_arm64.tar.gz"
      sha256 "fde22dce3636db31eaf00704f597a4e5db2480dad225bdba494fc551801c5674"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.5/javdb-cli_0.8.5_linux_amd64.tar.gz"
      sha256 "62b7eafecae7928babf255cfc2574eb5407553b654ae99e1589bcc52dde3e258"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
