class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_darwin_arm64.tar.gz"
      sha256 "e8e775ac2503e85f144b1a003999c6bad4e282b5b6515f0bc756a793a66fcb98"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_darwin_amd64.tar.gz"
      sha256 "67aab35819854bb69573734778fb7c338ffad59d93efc70300d35fb11211d3e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_linux_arm64.tar.gz"
      sha256 "69982e847e061b37f84e9d22da741b8a7203c7fab7a152af0ed3bdaa807a1cca"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_linux_amd64.tar.gz"
      sha256 "678bc1f1d07aaaf92d47d0241b050b580d5eb985f0e58f4477ae37b7e94724aa"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
