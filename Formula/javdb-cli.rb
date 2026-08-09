class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.2/javdb-cli_0.5.2_darwin_arm64.tar.gz"
      sha256 "c4f854822d0d58ddf4947fa7e865b3f9397be7fce28f71f13e9e368b826a0456"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.2/javdb-cli_0.5.2_darwin_amd64.tar.gz"
      sha256 "b01794ed6123773edadb8faefd6a5a02165b557031c1b7a744a6684c672c6d46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.2/javdb-cli_0.5.2_linux_arm64.tar.gz"
      sha256 "314547f55587886ce5e71dac25db642113e4b183b4d858d51d198c607d14b841"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.2/javdb-cli_0.5.2_linux_amd64.tar.gz"
      sha256 "7075b801792b10fdf5370e3a217f642d5ae15ec749d1e330fe8b242a55d590ac"
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
