class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "6703dd6012a89e4bf0bda8a067dc586d8a8b62d9d7b171ffaf959b2b9203696e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.7.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "f7ffbb6150d746932944860572490ff724285054f181995da06cd653e5e973bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3cd7fe1aac0eb598c27a803170299b3a294f0789c7f5dcd668b0b99a9c80cf79"
  end

  head do
    url "https://github.com/hendrikmaus/rust-workflows.git", branch: "master"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/rust-workflows"
  end
end
