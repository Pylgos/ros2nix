
{ nixpkgs
, py3version
, ...
}:
let
  py3pkgs = nixpkgs."python${py3version}Packages";
  callPackage = nixpkgs.lib.callPackageWith (nixpkgs // py3pkgs // self);
  self = {
    catkin-pkg = callPackage ../catkin {};
    colcon-argcomplete = callPackage ./argcomplete.nix {};
    colcon-bash = callPackage ./bash.nix {};
    colcon-cd = callPackage ./cd.nix {};
    colcon-cmake = callPackage ./cmake.nix {};
    colcon-core = callPackage ./core.nix {};
    colcon-defaults = callPackage ./defaults.nix {};
    colcon-devtools = callPackage ./devtools.nix {};
    colcon-library-path = callPackage ./library-path.nix {};
    colcon-metadata = callPackage ./metadata.nix {};
    colcon-notification = callPackage ./notification.nix {};
    colcon-output = callPackage ./output.nix {};
    colcon-package-information = callPackage ./package-information.nix {};
    colcon-package-selection = callPackage ./package-selection.nix {};
    colcon-pkg-config = callPackage ./pkg-config.nix {};
    colcon-parallel-executor = callPackage ./parallel-executor.nix {};
    colcon-powershell = callPackage ./powershell.nix {};
    colcon-python-setup-py = callPackage ./python-setup-py.nix {};
    colcon-recursive-crawl = callPackage ./recursive-crawl.nix {};
    colcon-ros = callPackage ./ros.nix {};
    colcon-test-result = callPackage ./test-result.nix {};
    colcon-zsh = callPackage ./zsh.nix {};
    colcon-common-extensions = callPackage ./common-extensions.nix { };
  };
in
{
  python3-colcon-common-extensions = self.colcon-common-extensions;
  python3-catkin-pkg-modules = self.catkin-pkg;
}