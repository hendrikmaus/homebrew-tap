class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "c29c863677871ea91d3f2df58a618d95bbb260dd6ca254027760a9cf9bb795c6"
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
    system "#{bin}/rust-workflows"
  end
end
