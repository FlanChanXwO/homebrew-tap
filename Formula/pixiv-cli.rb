class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.3.0/pixiv-cli_1.3.0_darwin_arm64.tar.gz"
      sha256 "bbcb4371a7f58a2df57f6d2f60c7b22589651e0f6ab182bad9c914032624cc9e"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.3.0/pixiv-cli_1.3.0_darwin_amd64.tar.gz"
      sha256 "d268a3454eb4b6c56c010e9169685ad09204acc50bc2287f76a06ac4d1c31f9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.3.0/pixiv-cli_1.3.0_linux_arm64.tar.gz"
      sha256 "c2308566a43edce23238792a75a33aff31709eedb96401e5f42e6497b6dcfcb2"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.3.0/pixiv-cli_1.3.0_linux_amd64.tar.gz"
      sha256 "271f231afff59f8392ee20f460d868d67eb2a3a87563d44ee2bddd082a8457e7"
    end
  end

  def install
    bin.install "pixiv"
  end

  def post_install
    # The hidden command reports integration failures without invalidating the
    # verified Homebrew installation; a normal browser login retries it.
    system bin/"pixiv", "auth", "_install-handler"
  end

  test do
    assert_equal "pixiv v#{version}\n", shell_output("#{bin}/pixiv --version")
  end
end
