{ nixpkgs
, py3version
, self
, ...
}:

let
  py3pkgs = nixpkgs."python${py3version}Packages";
  callPackage = nixpkgs.lib.callPackageWith (nixpkgs // py3pkgs // s // { catkin-pkg = self.python3-catkin-pkg-modules; });
  s = {
    ifcfg = callPackage ./python-ifcfg.nix {};
    rosdistro = callPackage ./rosdistro.nix {};
    rospkg = callPackage ./rospkg.nix {};
  };
in
{
  python3-rospkg = [ s.rospkg ];
  python3-ifcfg = [ s.ifcfg ];
  python3-rosdistro-modules = [ s.rosdistro ];
}