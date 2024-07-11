{ lib, distro }:
final: prev:

{
  python3 = prev.python3 // {
    pkgs = prev.python3.pkgs.overrideScope (
      pyFinal: pyPrev: {
        catkin-pkg = pyFinal.callPackage ./system-packages/catkin-pkg.nix { };
        flake8-quotes = pyFinal.callPackage ./system-packages/flake8-quotes.nix { };
        flake8-comprehensions = pyFinal.callPackage ./system-packages/flake8-comprehensions.nix { };
        flake8-builtins = pyFinal.callPackage ./system-packages/flake8-builtins.nix { };
        rosdistro = pyFinal.callPackage ./system-packages/rosdistro.nix { };
      }
    );
  };
}
