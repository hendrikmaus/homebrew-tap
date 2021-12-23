class RustWorkflows < Formula
  desc "A reference for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "58e62581764f59f65973acbe3e444400eafc93d2ec646ad24065ff6b87b37f17"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  head do
    url "https://github.com/hendrikmaus/rust-workflows.git"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "hello, world!", shell_output("RUST_LOG=info #{bin}/rust-workflows")
  end
end
