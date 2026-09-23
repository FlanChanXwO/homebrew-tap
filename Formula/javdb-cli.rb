class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.2/javdb-cli_0.8.2_darwin_arm64.tar.gz"
      sha256 "0c46bf7432562d0b72ba900b6f00f6c6c7fb7858fe3946f4c19fdf65156a29eb"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.2/javdb-cli_0.8.2_darwin_amd64.tar.gz"
      sha256 "39043bf6d6c40870fe09af1ae0302d15ef9bd6cf7a77933dc5cbc10ee169646f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.2/javdb-cli_0.8.2_linux_arm64.tar.gz"
      sha256 "7a3b0ffcd54e9aa2b50564fb13283852c3eb559cc32006af6d557a9073126529"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.2/javdb-cli_0.8.2_linux_amd64.tar.gz"
      sha256 "9f1a21ee38acf519f455873318d89690178ff6c7b1325d76accd39cdf43a5cb0"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
