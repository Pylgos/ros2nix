{ misc
, py3version
, ...
}:

let
  py3pkgs = nixpkgs."python${py3version}Packages";
  callPackage = nixpkgs.lib.callPackageWith (nixpkgs // py3pkgs // self);
  self = {
    catkin-pkg = callPackage ./catkin {};
    colcon-argcomplete = callPackage ./colcon/argcomplete.nix {};
    colcon-bash = callPackage ./colcon/bash.nix {};
    colcon-cd = callPackage ./colcon/cd.nix {};
    colcon-cmake = callPackage ./colcon/cmake.nix {};
    colcon-core = callPackage ./colcon/core.nix {};
    colcon-defaults = callPackage ./colcon/defaults.nix {};
    colcon-devtools = callPackage ./colcon/devtools.nix {};
    colcon-library-path = callPackage ./colcon/library-path.nix {};
    colcon-metadata = callPackage ./colcon/metadata.nix {};
    colcon-notification = callPackage ./colcon/notification.nix {};
    colcon-output = callPackage ./colcon/output.nix {};
    colcon-package-information = callPackage ./colcon/package-information.nix {};
    colcon-package-selection = callPackage ./colcon/package-selection.nix {};
    colcon-pkg-config = callPackage ./colcon/pkg-config.nix {};
    colcon-parallel-executor = callPackage ./colcon/parallel-executor.nix {};
    colcon-powershell = callPackage ./colcon/powershell.nix {};
    colcon-python-setup-py = callPackage ./colcon/python-setup-py.nix {};
    colcon-recursive-crawl = callPackage ./colcon/recursive-crawl.nix {};
    colcon-ros = callPackage ./colcon/ros.nix {};
    colcon-test-result = callPackage ./colcon/test-result.nix {};
    colcon-zsh = callPackage ./colcon/zsh.nix {};
    colcon-common-extensions = callPackage ./colcon/common-extensions.nix { };
  };
in
{
  python3-colcon-common-extensions = self.colcon-common-extensions;
  python3-catkin-pkg-modules = self.catkin-pkg;
  python3-ifcfg = [ self.ifcfg ];
  python3-rosdistro-modules = [ self.rosdistro ];
}