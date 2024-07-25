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
        rev = "874f7510aa77ae6a1eba8da0327d5c942551f32d";
        hash = "sha256-iAe7JtWbVw8l882zkWoqtKYTsYj83lHZScausJuq7Nc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_clang_format";
  version = "0.12.11-1";
  src = sources.ament_clang_format;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ clang buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clang python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
