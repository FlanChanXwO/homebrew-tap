class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.4.0/pixiv-cli_1.4.0_darwin_arm64.tar.gz"
      sha256 "720b984627446930479063acac34641d62bb92920df1722049007817e415bdb1"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.4.0/pixiv-cli_1.4.0_darwin_amd64.tar.gz"
      sha256 "4231e1fb9d3d1c7758bd0e4d927c208c91069b0ff3c9252978af9d05c20ad368"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.4.0/pixiv-cli_1.4.0_linux_arm64.tar.gz"
      sha256 "17335115e1a511179092f733f7d4f6263ed35486bc5a050bd69439044fe79c08"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.4.0/pixiv-cli_1.4.0_linux_amd64.tar.gz"
      sha256 "b5c671538d14cc7e93d86da6c088f836ac8deb4aac20fd436ff72fe71fbc187e"
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
