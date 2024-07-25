{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  clang,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_clang_format = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "448660b58b9166a48485a38143bc83f8703f33bf";
        hash = "sha256-eW7pKE4p8IPRiK1fRYOKhjjn0s+zZwv2K41dOsF5Rno=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_clang_format";
  version = "0.14.3-1";
  src = sources.ament_clang_format;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ clang buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clang python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
