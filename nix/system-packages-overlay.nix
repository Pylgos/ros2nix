{ lib, distro }:
final: prev:

{
  python3 = prev.python3 // {
    pkgs = prev.python3.pkgs.overrideScope (
      pyFinal: pyPrev:
      let
        pkgList = (prev.poetry2nix.mkPoetryPackages {
          projectDir = ../poetry;
          python = prev.python3;
          overrides = prev.poetry2nix.overrides.withDefaults (final: prev: {
            inherit (pyFinal) docutils flake8;
            flake8-builtins = prev.flake8-builtins.overridePythonAttrs (oldAttras: {
              nativeBuildInputs = oldAttras.nativeBuildInputs ++ [ final.hatchling ];
            });
            
          });
        }).poetryPackages;
        pkgsByNames = lib.listToAttrs (map (drv: { name = drv.pname; value = drv; }) pkgList);
      in {
        inherit (pkgsByNames) rosdistro catkin-pkg flake8-quotes flake8-comprehensions flake8-builtins colcon-common-extensions;
      }
    );
  };
  python3Packages = final.python3.pkgs;
}
