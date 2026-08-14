class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.1/javdb-cli_0.7.1_darwin_arm64.tar.gz"
      sha256 "0d263fd3115824157cfaa9d2ad97340f990c9488efd8ec756458793f8a7a11d0"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.1/javdb-cli_0.7.1_darwin_amd64.tar.gz"
      sha256 "220a867405709dd225dcd12b4fc7490dd62b5715a14a8e702593160ae130dcf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.1/javdb-cli_0.7.1_linux_arm64.tar.gz"
      sha256 "3e56f92237665f7cf10c0596afaec224d5b8b16d180160cafa7de1b6fbb1f10c"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.1/javdb-cli_0.7.1_linux_amd64.tar.gz"
      sha256 "7536dd42ccfbba01a24c6f51d680085b9ee3c92bb53d07b083ac542f894bc246"
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
