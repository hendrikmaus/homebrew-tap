class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "5646bc28ca59cdb5771a035d9be5b7d200d4428aaccfdadea04ed2293a45ae16"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.8.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "ce5b5e76def954fa54e5a74f9c29994ebb470e46306b13092c65c5261f756385"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85473d17882e35cc8f498c7af9741db925cf46225265030203a852c6e8762873"
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
